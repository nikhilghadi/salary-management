class SalaryInsights
  def self.for_country(country)
    employees = Employee.where(country: country)

    {
      min_salary: employees.minimum(:salary)&.to_f,
      max_salary: employees.maximum(:salary)&.to_f,
      avg_salary: employees.average(:salary)&.to_f
    }
  end
end