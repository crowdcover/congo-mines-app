class ReportsController < ApplicationController

  def show
  end

  def index
    @report = Report.all
    render :json
  end

  private
  def report_params
    params.require(:report).permit(:title, :organization, :summary)
  end
end
