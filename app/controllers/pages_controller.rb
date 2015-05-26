class PagesController < ApplicationController
  def show
    @page = Page.includes(:reports).find(params[:id])
    @reports = @page.reports.order('actual_post_date DESC').page(params[:page]).per(12)
    # fail
  end
end
