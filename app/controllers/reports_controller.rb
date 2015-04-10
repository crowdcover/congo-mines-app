class ReportsController < ApplicationController

  def show
    @report = Report.find(params[:id])
    render json: @report
  end

  def index
    @reports = Report.all
    # render json: @reports
    render :index
  end

  private
  def report_params
    params.require(:report).permit(:title, :organization, :summary)
  end
end
