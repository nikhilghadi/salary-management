class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :update, :destroy]
  def index
    page = params[:page].to_i || 1
    per_page = params[:per_page].to_i || 10

    page = 1 if page <= 0
    per_page = 10 if per_page <= 0

    employees = Employee
                .offset((page - 1) * per_page)
                .limit(per_page)
    render json: {
      data: employees,
      page: page,
      per_page: per_page,
      total: Employee.count
    }
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

  def update
    if @employee && @employee.update(employee_params)
      render json: @employee
    elsif @employee
      render json: { errors: @employee.errors.full_messages }, status: :unprocessable_entity
    else
      render json: { error: "Employee not found" }, status: :not_found
    end
  end

  def destroy
    if @employee && @employee.destroy
      render json: { message: "Employee deleted successfully" }, status: :no_content
    elsif @employee
      render json: { errors: @employee.errors.full_messages }, status: :unprocessable_entity
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