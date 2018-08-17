class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update]

  def index
    @employees = Employee.all
  end

  def show
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      redirect_to employee_path(@employee)
    else
      redirect_to new_employee_path
    end
  end

  def edit
  end

  def update
    if @employee.update employee_params
      redirect_to employee_path(@employee)
    else
      redirect_to edit_employee_path @employee
    end
  end

  def delete
    employee = Employee.find params[:id]
    employee.destroy
    redirect_to employees_path
  end

  private

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id)
  end

end
