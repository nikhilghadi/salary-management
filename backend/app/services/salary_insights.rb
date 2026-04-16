class SalaryInsights
  def self.for_country(country)
    employees = Employee.where(country: country)

    {
      min_salary: employees.minimum(:salary)&.to_f,
      max_salary: employees.maximum(:salary)&.to_f,
      avg_salary: employees.average(:salary)&.to_f
    }
  end

  def self.for_job_title(country, job_title)
    employees = Employee.where(country: country, job_title: job_title)

    employees.average(:salary)&.to_f
    
  end 

  def self.median_salary(country)
    salaries = Employee.where(country: country).order(:salary).pluck(:salary)

    return { median_salary: nil } if salaries.empty?

    mid = salaries.length / 2

    median =
      if salaries.length.odd?
        salaries[mid]
      else
        (salaries[mid - 1] + salaries[mid]) / 2.0
      end

    { median_salary: median.to_f }
  end

  def self.top_earners(country, limit = 5)
    employees = Employee
                  .where(country: country)
                  .order(salary: :desc)
                  .select(:id, :first_name, :last_name, :salary)
                  .limit(limit)

    employees.map do |employee|
      {
        id: employee.id,
        name: employee.full_name,
        salary: employee.salary.to_f
      }
    end
  end
end