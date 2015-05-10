class SearchesController < ApplicationController

  def show
    @search = search(params[:search])
    @reports = @search.results
    # fail
    render :show2
  end

  protected
  def search(options)
    categories = []
    categories << options[":theme"].to_i << options[":type_document"].to_i <<
      options[":type_source"].to_i << options[":province"].to_i
    categories.delete(0) # removing blank categories (to_i turns them to 0)
    Sunspot.search(Report) do
      with(:category_ids).all_of(categories)
      keywords options[":query"]
      order_by :actual_post_date, :desc
      paginate(per_page: 12)
    end
  end
end
