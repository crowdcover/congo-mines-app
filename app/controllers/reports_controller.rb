class ReportsController < ApplicationController

  def show
    @report = Report.published.includes(:attachments, :source, :author, :categories,
      :drc_companies).find(params[:id])
    render :show
  end

  def index
    @rec_reports = Report.published.where(recommended: true).order('actual_post_date DESC').page(params[:page]).per(2)

    # need to add that @reports can't include reports in the @rec_reports
    @reports = Report.published.all.order('actual_post_date DESC').page(params[:page]).per(12)

    #for testing while no reports marked as recommended
    # @rec_reports = Report.all.order('actual_post_date DESC').page(params[:page]).per(2)
    render :index
  end

  private
  def report_params
  end
end
