class User < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :name, :symbol
    change_column :users, :email, :symbol
  end
end
