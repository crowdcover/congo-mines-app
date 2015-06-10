class PagesController < ApplicationController
  before_action :sicomines?

  def show
    # @page = Page.includes(:reports).find(params[:id]) # , :drc_company_reports

    @reports = @page.reports.order('actual_post_date DESC')
                .page(params[:page]).per(12) unless @page.reports.empty?
    # @drc_company_reports = @page.drc_company.reports
    #                         .order(actual_post_date: :desc)
    #                         .page(params[:page])
    #                         .per(12) unless @page.drc_company.nil?
    # fail


  end

  def show_sicomines
    # @page = Page.find(params[:id])
    @search = sicomines_search
    @reports = @search.results
    # @reports = @page.drc_company.reports.order(actual_post_date: :desc)
                                  # .page(params[:page])
                                  # .per(12)
    # fail
    render :show
  end

  protected
  def sicomines_search
    Report.search do
      any do
        fulltext "Sicomines"
        fulltext '"La Sino Congolaise Des Mines"'
        with(:drc_company_ids, 74)
      end
      order_by :actual_post_date, :desc
      paginate(page: params[:page], per_page: 12)
    end
  end

  def sicomines?
    # show_sicomines if params[:id] == '1'
    @page = Page.find(params[:id])
    # if @page.drc_company_id == 74
    if @page.id == 6
      show_sicomines
    else
      show
    end
  end
end
