class ReportsController < ApplicationController

  def show
    @report = Report.find(params[:id])
    render :json
  end

  def index
    @report = Report.all
    render :index
  end

  private
  def report_params
    params.require(:report).permit(:title, :organization, :summary)
  end
end
