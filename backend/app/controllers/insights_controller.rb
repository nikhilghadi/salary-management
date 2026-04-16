class InsightsController < ApplicationController
  def country
    if params[:country].blank?
      return render json: { error: "country parameter is required" }, status: :unprocessable_entity
    end
    insights = SalaryInsights.for_country(params[:country])
    render json: insights
  end

  def job_title

    avg_salary = SalaryInsights.for_job_title(params[:country], params[:job_title])
    render json: { avg_salary: avg_salary }
  end
end