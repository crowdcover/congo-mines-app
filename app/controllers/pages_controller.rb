class PagesController < ApplicationController
  def show
    @page = Page.includes(:reports).find(params[:id]) # , :drc_company_reports
    @reports = @page.reports.order('actual_post_date DESC')
                .page(params[:page]).per(12) unless @page.reports.empty?
    @drc_company_reports = @page.drc_company.reports
                            .order(actual_post_date: :desc)
                            .page(params[:page])
                            .per(12) unless @page.drc_company.nil?
    # fail
  end
end
