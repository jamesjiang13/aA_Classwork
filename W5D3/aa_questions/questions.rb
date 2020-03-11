require 'singleton'
require 'sqlite3'
require 'byebug'

class QuestionsDatabase < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Users
  attr_accessor :fname, :lname

  def self.find_by_id(id)
    data = QuestionsDatabase.instance.execute("SELECT * FROM users WHERE id = #{id}")
    data.map { |datum| Users.new(datum) }
  end
  # now options = datum (piece of info/data)
  
  def self.find_by_name(fname, lname)
    data = QuestionsDatabase.instance.execute("SELECT * FROM users WHERE fname = #{fname} AND lname = #{lname}")
    data.map { |datum| Users.new(datum) }
  end
  
  def initialize(options) # [3,jason,wintery]
    @id = options['id']
    @fname = options['fname'] #= hash[key]
    @lname = options['lname']
  end

  def authored_questions # if i pass in an author, i should get back all the questions he/she asked
    QuestionsDatabase.instance.execute(<<-SQL, @id)
    SELECT 
      *
    FROM 
      questions
    WHERE
      author_id = ?
    ;
    SQL
    
  end

  def authored_replies
    QuestionsDatabase.instance.execute(<<-SQL, @id)
    SELECT
      *
    FROM
      replies
    WHERE
      users_id = ?
    ;
    SQL
  end
end

class Questions
  
  attr_accessor :title, :body
  attr_reader :author_id

  def self.find_by_id(id)
    data = QuestionsDatabase.instance.execute("SELECT * FROM questions WHERE id = #{id}")
    data.map { |datum| Users.new(datum) }
  end

  def self.find_by_questions(title, body, author_id)
    data = QuestionsDatabase.instance.execute("SELECT * FROM questions WHERE title = #{title} AND body = #{body} AND author_id = #{author_id}")
    #[{id => 3}, {fname => 'jason'}, {lname => 'wintery'}]
    
    data.map { |datum| Users.new(datum) }  # == [3,jason,wintery] = 'option'
  end

  def self.find_by_author_id(author_id)
    data = QuestionsDatabase.instance.execute("SELECT * FROM questions WHERE author_id = #{author_id}")
    data.map { |datum| Users.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @author_id = options['author_id']
  end
  
  def author
    QuestionsDatabase.instance.execute(<<-SQL, @id) 
    SELECT
      *
    FROM
      questions
    WHERE
      author_id = ?
    ;
    SQL
  end

  def replies
    QuestionsDatabase.instance.execute(<<-SQL, @id)
    SELECT
      *
    FROM
      replies
    WHERE
      questions_id = ?
    ;
    SQL
  end

end

class QuestionsFollows
  
  def self.followers_for_question_id(question_id)
    QuestionsDatabase.instance.execute(<<-SQL, question_id)
    SELECT
      *
    FROM
      questions_follows
    JOIN
      users ON questions_follows.users_id = users.id
    WHERE
      questions_id = ?

    SQL
  end

  def self.followed_questions_for_user_id(user_id)
  


  end


  def initialize(options)
    @questions_id = options['questions_id']
    @users_id = options['users_id']
  end
 
end

class Replies

  attr_accessor :body
  attr_reader :parent_reply_id, :users_id, :questions_id

  def self.find_by_id(id)
    data = QuestionsDatabase.instance.execute("SELECT * FROM replies WHERE id = #{id}")
    data.map { |datum| Users.new(datum) }
  end

  def self.find_by_user_id(id)
    data = QuestionsDatabase.instance.execute("SELECT * FROM replies WHERE users_id = #{id}")
    data.map { |datum| Users.new(datum) }
  end
 
  def self.find_by_question_id(id)
    data = QuestionsDatabase.instance.execute("SELECT * FROM replies WHERE questions_id = #{id}")
    data.map { |datum| Users.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @parent_reply_id = options['parent_reply_id']
    @users_id = options['users_id']
    @body = options['body']
    @questions_id = options['questions_id']
  end

  def author
    QuestionsDatabase.instance.execute(<<-SQL, @users_id)
    SELECT
      *
    FROM
      replies
    WHERE
      users_id = ?
    ;
    SQL
  end

  def question
    QuestionsDatabase.instance.execute(<<-SQL, @questions_id)
    SELECT
      *
    FROM
      replies
    WHERE
      questions_id = ?
    ;
    SQL
  end

  def parent_reply
    QuestionsDatabase.instance.execute(<<-SQL, @parent_reply_id)
    SELECT
      *
    FROM
      replies
    WHERE
      parent_reply_id = ?
    ;
    SQL
  end

  def child_replies
    QuestionsDatabase.instance.execute(<<-SQL, @id)
    SELECT
      *
    FROM
      replies
    WHERE
      parent_reply_id = ?
    ;
    SQL
    
  end
end

class QuestionsLikes
  attr_reader :questions_id, :users_id

  def initialize(options)
    @questions_id = options['questions_id']
    @users_id = options['users_id']
  end


end


# p Users.find_by_id(1)
# p Users.find_by_id(2)
 j = Users.find_by_id(3)
#  debugger
 p j.first.authored_replies
 p j.first.authored_questions


