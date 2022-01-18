require 'byebug'

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
    attr_reader :salary, :name, :title
    attr_accessor :employees
    def initialize(name, title, salary, boss)
        super
        @employees = []
        if @boss != nil
            @boss.employees += self.employees
        end

        #  if !employee.employees.empty?
        #         @employees += employee.employees
    end

    def bonus(multiplier)
        # debugger
        total_salary = 0
        @employees.each do |employee|
            total_salary += employee.salary
        end
        total_salary * multiplier
    end
end

Ned = Manager.new("Ned", "Founder", 1000000, nil)
Darren = Manager.new("Darren", "TA Manager", 78000, Ned)
Shawna = Employee.new("Shawna", "TA", 12000, Darren)
David = Employee.new("David", "TA", 10000, Darren)

p Ned.bonus(5) # => 500_000
p Darren.bonus(4) # => 88_000
p David.bonus(3) # => 30_000