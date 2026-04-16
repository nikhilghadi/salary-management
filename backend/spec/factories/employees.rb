FactoryBot.define do
  factory :employee do
    first_name { "Nikhil" }
    last_name { "Ghadi" }
    emp_code { "E12345" }
    job_title { "Engineer" }
    department { "Engineering" }
    country { "India" }
    branch_location { "Bangalore" }
    salary { 50000 }
  end
end
