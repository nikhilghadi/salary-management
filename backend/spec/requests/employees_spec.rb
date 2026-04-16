require 'rails_helper'

RSpec.describe "Employees API", type: :request do
  describe "GET /employees" do
    it "returns all employees" do
      create_list(:employee, 3)

      get "/employees"

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).size).to eq(3)
    end
  end

  describe "POST /employees" do
    it "creates a new employee" do
      params = {
        employee: {
          first_name: "Nikhil",
          last_name: "Ghadi",
          emp_code: "E12345",
          job_title: "Engineer",
          country: "India",
          branch_location: "Bangalore",
          department: "Engineering",
          salary: 50000
        }
      }

      expect {
        post "/employees", params: params
      }.to change(Employee, :count).by(1)

      expect(response).to have_http_status(:created)
    end
  end
end