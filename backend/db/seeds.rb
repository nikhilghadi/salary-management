# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'securerandom'

first_names = File.readlines(Rails.root.join('db/seeds/first_names.txt')).map(&:strip)
last_names  = File.readlines(Rails.root.join('db/seeds/last_names.txt')).map(&:strip)

JOB_TITLES = ["Engineer", "Manager", "HR"]
DEPARTMENTS = ["Engineering", "HR", "Sales"]
COUNTRIES = ["India", "USA", "UK"]
BRANCHES = ["Bangalore", "Mumbai", "New York"]

employees = []

10000.times do |i|
  first = first_names.sample
  last  = last_names.sample

  employees << {
    emp_code: "E#{10000 + i}",
    first_name: first,
    last_name: last,
    job_title: JOB_TITLES.sample,
    department: DEPARTMENTS.sample,
    country: COUNTRIES.sample,
    branch_location: BRANCHES.sample,
    salary: rand(30000..150000),
    created_at: Time.current,
    updated_at: Time.current
  }
end

# 🔥 Bulk insert
Employee.insert_all(employees)