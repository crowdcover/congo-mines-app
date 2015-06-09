class SearchesController < ApplicationController

  def show
    #@search = search(params[:search])
    #@reports = @search.results

    #@search = Report.
    #s = DrcCompany.search{|q| q.fulltext ' rapport de l’association' }

    search = Report.search do |q|
       q.fulltext params[:search]
       q.paginate page: params[:page], per_page: 12
    end
    @reports = @results = search.results

    #binding.pry
=begin
    # Good For DRC Company
    search = DrcCompany.search do |q|
       q.fulltext params[:search]
       q.paginate page: params[:page], per_page: 12
    end
    @results = search.results
    @reports = @results.map(&:reports).first
=end

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
