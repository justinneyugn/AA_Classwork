require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries #title => salary
        @employees = []
    end

    def valid_title?(title)
        if @salaries.has_key?(title)
            return true
        else
            return false
        end
    end

    def >(other_startup)
        return true if self.funding > other_startup.funding

        false
    end

    def hire(employee_name, title)
        if !@salaries.has_key?(title)
            raise_error
        else
            new_employee = Employee.new(employee_name,title)
            @employees << new_employee
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee1)
        title = employee1.title
        salary = @salaries[title]
        if @funding >= salary
            pay = employee1.pay(salary.to_i)
            @funding -= salary
        else
            raise_error
        end
    end
    
    def payday
        @employees.each { |employee| pay_employee(employee)}
    end

    def average_salary
        total = 0

        @employees.each do |employee| 
            salary = @salaries[employee.title]
            total += salary
        end

        total / @employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(stp)
        @funding += stp.funding

        stp.salaries.each { |title, salary| @salaries[title] = salary if !@salaries.has_key?(title) }
        
        stp.employees.each { |employee| @employees << employee }

        stp.close
    end
end
