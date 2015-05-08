class SearchesController < ApplicationController

  def show
    @search = search(params)
    @reports = @search.results
    # fail
    render :show2
  end

  protected
  def search(options)
    Sunspot.search(Report) do
      keywords options[:query]
      order_by :actual_post_date, :desc
      paginate(per_page: 12)
    end
  end
end
