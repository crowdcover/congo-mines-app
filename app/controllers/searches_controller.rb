class SearchesController < ApplicationController

  def show
    @search = search(params[:search])
    @reports = @search.results #.page(params[:page])
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
      with(:drc_company_ids, options[":drc_company_id"].to_i)  # all_of? any? any_of?
      keywords options[":query"]
      order_by :actual_post_date, :desc
      paginate(page: params[:page], per_page: 12)
    end
  end
end
