class ReportsController < ApplicationController

  def show
    @report = Report.includes(:attachments, :source, :author, :categories,
      :congolese_companies).find(params[:id])
    # render json: @report
    render :show
  end

  def index
    @reports = Report.all
    # render json: @reports
    render :index
  end

  private
  def report_params
    params.require(:report).permit(:title, :date, :summary, :congolese_companies)
  end
end
