class SearchesController < ApplicationController

  def show
    categories = []
    categories = [:theme, :type_document, :type_source, :province].map{|c| params[c].to_i }.compact
    categories.delete(0)

    search = Report.search do
       fulltext params[:search]
       #q.keywords  params[:search]
       with(:category_ids).all_of(categories) unless categories.blank?
       order_by :actual_post_date, :desc
       paginate page: params[:page], per_page: 12
    end

    @reports = @results = search.results
  end

  protected
  def search(options)

    categories = [:theme, :type_document, :type_source, :province].map{|c| options[c] }.reject(&:empty?)

    #categories << options[:theme].to_i << options[:type_document].to_i <<
    #  options[:type_source].to_i << options[:province].to_i
    #categories.delete(0) # removing blank categories
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
