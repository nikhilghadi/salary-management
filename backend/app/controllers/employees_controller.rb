class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show]
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

  def show
    if @employee
      render json: @employee
    else
      render json: { error: "Employee not found" }, status: :not_found
    end
  end
  private

  def set_employee
    @employee = Employee.find(params[:id]) rescue nil
  end

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :emp_code, :job_title, :country, :branch_location, :department, :salary)
  end
end