class EmployeesController < ApplicationController
  def index
    employees = Employee.all
    render json: employees
  end

  def create
    employee = Employee.new(employee_params)

    if employee.save
      render json: employee, status: :created
    else
      render json: { errors: employee.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :emp_code, :job_title, :country, :branch_location, :department, :salary)
  end
end