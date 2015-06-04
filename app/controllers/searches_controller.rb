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
    categories << options[:theme].to_i << options[:type_document].to_i <<
      options[:type_source].to_i << options[:province].to_i
    categories.delete(0) # removing blank categories
    # fail
    Sunspot.search(Report) do
      with(:category_ids).all_of(categories)
      # with(:drc_company_ids, options[:drc_company_id].to_i)
      keywords options[:query]
      order_by :actual_post_date, :desc
      paginate(page: params[:page], per_page: 12)
    end
  end
end
