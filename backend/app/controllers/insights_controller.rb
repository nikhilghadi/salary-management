class InsightsController < ApplicationController
  def country
    if params[:country].blank?
      return render json: { error: "country parameter is required" }, status: :unprocessable_entity
    end
    insights = SalaryInsights.for_country(params[:country])
    render json: insights
  end

  def job_title
    if params[:country].blank? || params[:job_title].blank?
      return render json: { error: "country and job_title parameters are required" }, status: :unprocessable_entity
    end
    avg_salary = SalaryInsights.for_job_title(params[:country], params[:job_title])
    render json: { avg_salary: avg_salary }
  end

  def median_salary
    if params[:country].blank?
      return render json: { error: "country parameter is required" }, status: :unprocessable_entity
    end
    insights = SalaryInsights.median_salary(params[:country])
    render json: insights
  end

  def top_earners
    if params[:country].blank?
      return render json: { error: "country parameter is required" }, status: :unprocessable_entity
    end

    limit = params[:limit] || 5
    top_earners = SalaryInsights.top_earners(params[:country], limit.to_i)
    render json: top_earners
  end
end