class ReportsController < ApplicationController

  def show
    @report = Report.includes(:attachments, :source, :author, :categories,
      :drc_companies).find(params[:id])
    # render json: @report
    render :show
  end

  def index
    # sort by most recent
    @reports = Report.all
    # render json: @reports
    render :index
  end

  private
  def report_params
    params.require(:report).permit(:title, :date, :summary, :post_date, :cm_url,
      :drc_companies, :attachments, :source)
  end
end
