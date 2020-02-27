require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries)    # salaries = {`title` => `salary`}
        @name = name
        @funding = funding
        @employees = []    # [ [name, title], [name2, title2] ]
        @salaries = salaries
    end

    def valid_title?(title)
        @salaries.has_key?(title)
    end

    def >(startup)
        self.funding > startup.funding
    end

    def hire(name, title)
        valid_title?(title) ? @employees << Employee.new(name, title) : error
    end

    def size
        @employees.count
    end
    
    def pay_employee(employee)
        if @funding > @salaries[employee.title]
            @funding -= @salaries[employee.title]
            employee.pay(@salaries[employee.title])
        else
            error
        end
    end

    def payday
        @employees.each { |employee| pay_employee(employee) }
    end

    def average_salary
        sals = []
        @employees.each { |employee| sals << @salaries[employee.title] }
        sals.sum / size
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(other_startup)
        @funding += other_startup.funding

        other_startup.salaries.each do |title,salary|
            if !@salaries.has_key?(title)
                @salaries[title] = salary
            end
        end
        
        @employees += other_startup.employees
        other_startup.close
    end
end
