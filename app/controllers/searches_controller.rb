class SearchesController < ApplicationController

  def show
    @search = search(params)
    @reports = @search.results
    # fail
  end

  protected
  def search(options)
    Sunspot.search(Report) do
      keywords options[:query]
      order_by :actual_post_date, :desc

    end
  end
end
