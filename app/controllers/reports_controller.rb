class ReportsController < ApplicationController

  def show
    @report = Report.includes(:attachments, :source, :author, :categories,
      :drc_companies).find(params[:id])
    # render json: @report
    render :show
  end

  def index
    # sort by most recent
    @reports = Report.all.order('actual_post_date DESC')
    # Report.featured

    # render json: @reports
    render :index
  end

  private
  def report_params
  end
end
