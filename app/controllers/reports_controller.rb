class ReportsController < ApplicationController

  def show
    @report = Report.includes(:attachments, :source, :author, :categories,
      :drc_companies).find(params[:id])
    render :show
  end

  def index
    @reports = Report.all.order('actual_post_date DESC').page(params[:page]).per(12)
    @rec_reports = Report.where(recommended: true).order('actual_post_date DESC').page(params[:page]).per(2)

    #for testing while no reports marked as recommended
    # @rec_reports = Report.all.order('actual_post_date DESC').page(params[:page]).per(2)
    render :index
  end

  private
  def report_params
  end
end
