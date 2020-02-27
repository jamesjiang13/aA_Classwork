class Bootcamp
    attr_reader :name, :students, :slogan, :teachers
    
    def initialize(name, slogan, student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
        @teachers = []
        @students = []
        @grades = Hash.new { |hash, key| hash[key] = [] }
    end

    def hire(teacher)
        @teachers << teacher
    end

    def enroll(student)
        if @students.count < @student_capacity
            @students << student
            true
        end
        false
    end

    def enrolled?(student)
        @students.include?(student)
    end

    def student_to_teacher_ratio
        @students.count / @teachers.count
    end

    def add_grade(student, grade)
        if @students.include?(student)
            @grades[student] << grade
            true
        end
        false
    end

    def num_grades(student)
       @grades[student].count 
    end
        
    def average_grade(student)
        return nil if @grades[student].length == 0 || @grades[student] == nil
        @grades[student].sum / @grades[student].length 
    end

end
