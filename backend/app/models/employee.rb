class Employee < ApplicationRecord
  validates :first_name, :last_name, :emp_code, :job_title, :country, :branch_location, :salary, presence: true

  validates :salary, numericality: { greater_than: 0 }
end
