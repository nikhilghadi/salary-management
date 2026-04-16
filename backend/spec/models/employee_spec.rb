require 'rails_helper'

RSpec.describe Employee, type: :model do
  it "is valid with valid attributes" do
    employee = Employee.new(
      first_name: "Nikhil",
      last_name: "Ghadi",
      emp_code: "E12345",
      job_title: "Engineer",
      country: "India",
      department: "Engineering",
      branch_location: "Bangalore",
      salary: 50000
    )

    expect(employee).to be_valid
  end
end