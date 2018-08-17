class Dog < ApplicationRecord
  has_many :employees

  def employee_name= first_name

    self.employee = Employee.find_or_create_by first_name: first_name
  end

  def employee_name
    self.employee ? self.employee.name : nil
  end
end
