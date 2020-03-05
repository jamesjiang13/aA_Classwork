class Employee
  attr_reader :name, :title, :salary, :boss

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    bonus = salary * multiplier
  end

end

class Manager < Employee
  attr_reader :employees

  def initialize(name, title, salary, boss, employees)
    @employees = employees
    super(name, title, salary, boss)
  end

  def bonus(multiplier)
    emp_salaries = employees.inject(0){|acc, employee| acc += employee.salary}
    bonus = emp_salaries * multiplier
  end

end

shauna = Employee.new("shauna", 'ta', 12000, 'darren')
david = Employee.new('david', 'ta', 10000, 'darren')
darren = Manager.new("darren", 'ta manager', 78000, "ned", [shauna, david])
ned = Manager.new("ned", "founder", 1000000, nil, [darren, shauna, david])

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000