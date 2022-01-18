class Employee
    attr_reader :name, :title, :salary, :boss

    def initialize(name, title, salary, boss)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
    end

    def bonus(multiplier)
        @salary * multiplier
    end
end

class Manager < Employee
    attr_reader :employees
    def initialize(name, title, salary, boss)
        super
        @employees = []
    end

    def bonus(multiplier)
        total_salary = 0
        @employees.each do |employee|
            total_salary += employee.salary
        end
        total_salary * multiplier
    end
end

Ned = Employee.new("Ned", "Founder", 1000000, nil)
Darren = Employee.new("Darren", "TA Manager", 78000, )