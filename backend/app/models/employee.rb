class Employee < ApplicationRecord
  validates :first_name, :last_name, :emp_code, :job_title, :country, :branch_location, :salary, presence: true
end
