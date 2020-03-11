# == Schema Information
#
# Table name: nobels
#
#  yr          :integer
#  subject     :string
#  winner      :string

require_relative './sqlzoo.rb'

def physics_no_chemistry
  # In which years was the Physics prize awarded, but no Chemistry prize?

  # note for future: self join on year, select yr where phys exist & chem no
  execute(<<-SQL)
  SELECT 
    yr
  FROM 
    nobels
  WHERE
    subject = 'Chemistry' AND 
  SQL
end
