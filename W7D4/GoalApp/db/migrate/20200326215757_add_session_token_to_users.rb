class AddSessionTokenToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :session_token, :string
    add_index :users, :session_token, unique: true
    change_column_null :users, :session_token, false
  end
end


# rails _5.2.3_ new GoalApp -G -database=postgres  # wrong
# rails _5.2.3_ new GoalApp -G --database=postgres # right

# rails _5.2.3_ new GoalApp -G --d=postgres  # wrong
# rails _5.2.3_ new GoalApp -G -d=postgres # right