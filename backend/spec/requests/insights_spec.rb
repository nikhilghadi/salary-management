require 'rails_helper'

RSpec.describe "Insights API", type: :request do
  describe "GET /insights/country" do
    it "returns min, max and avg salary for a country" do
      create(:employee, country: "India", salary: 30000)
      create(:employee, country: "India", salary: 50000)
      create(:employee, country: "India", salary: 70000)

      get "/insights/country", params: { country: "India" }

      expect(response).to have_http_status(:ok)

      data = JSON.parse(response.body)

      expect(data["min_salary"]).to eq(30000)
      expect(data["max_salary"]).to eq(70000)
      expect(data["avg_salary"]).to eq(50000)
    end
  end

  it "returns empty values if no employees found" do
    get "/insights/country", params: { country: "America" }

    data = JSON.parse(response.body)

    expect(data["min_salary"]).to be_nil
    expect(data["max_salary"]).to be_nil
    expect(data["avg_salary"]).to be_nil
  end

  it "returns error when country param is missing" do
    create(:employee, country: "India", salary: 30000)
    create(:employee, country: "India", salary: 50000)
    get "/insights/country"
    expect(response).to have_http_status(:unprocessable_entity)

    data = JSON.parse(response.body)
    expect(data["error"]).to eq("country parameter is required")
  end

  describe "GET /insights/job_title" do
    it "returns avg salary for job title in a country" do
      create(:employee, country: "India", job_title: "Engineer", salary: 40000)
      create(:employee, country: "India", job_title: "Engineer", salary: 60000)

      get "/insights/job_title", params: { country: "India", job_title: "Engineer" }

      expect(response).to have_http_status(:ok)

      data = JSON.parse(response.body)

      expect(data["avg_salary"]).to eq(50000)
    end
  end

  it "returns error when country and job_title params are missing" do
    create(:employee, country: "India", salary: 30000)
    create(:employee, country: "India", salary: 50000)
    get "/insights/job_title"
    expect(response).to have_http_status(:unprocessable_entity)

    data = JSON.parse(response.body)
    expect(data["error"]).to eq("country and job_title parameters are required")
  end

  describe "GET /insights/median_salary" do
    it "returns median salary for a country" do
      create(:employee, country: "India", salary: 30000)
      create(:employee, country: "India", salary: 50000)
      create(:employee, country: "India", salary: 70000)

      get "/insights/median_salary", params: { country: "India" }

      expect(response).to have_http_status(:ok)

      data = JSON.parse(response.body)
      expect(data["median_salary"]).to eq(50000.0)
    end
  end

  describe "GET /insights/top_earners" do
    it "returns top earners in a country" do
      create(:employee, country: "India", salary: 30000)
      create(:employee, country: "India", salary: 70000)
      create(:employee, country: "India", salary: 90000)

      get "/insights/top_earners", params: { country: "India", limit: 2 }

      expect(response).to have_http_status(:ok)

      data = JSON.parse(response.body)

      expect(data.length).to eq(2)
      expect(data.first["salary"]).to eq(90000.0)
    end
  end

  describe "GET /insights/department" do
    it "returns avg salary per department in a country" do
      create(:employee, country: "India", department: "Engineering", salary: 50000)
      create(:employee, country: "India", department: "Engineering", salary: 70000)
      create(:employee, country: "India", department: "HR", salary: 30000)

      get "/insights/department", params: { country: "India" }

      expect(response).to have_http_status(:ok)

      data = JSON.parse(response.body)

      expect(data["Engineering"]).to eq(60000.0)
      expect(data["HR"]).to eq(30000.0)
    end
  end
end