# frozen_string_literal: true

class SearchesController < ApplicationController
  def show
    @search_params = params[:search]

    categories = []
    categories = %i[theme type_document type_source province].map { |c| params[c].to_i }.compact
    categories.delete(0)

    @category_names = Category.find(categories).map(&:name).join(', ') if categories.present?

    search = Report.search do
      fulltext params[:search]
      # q.keywords  params[:search]
      with(:category_ids).all_of(categories) if categories.present?
      order_by :actual_post_date, :desc

      # with :draft, false
      with(:visibility).any_of(['published'])
      paginate page: params[:page], per_page: 12
    end

    @reports = @results = search.results
    # @result_total_found = @reports.total
  end

  #   protected
  #   def search(options)
  #
  #     categories = [:theme, :type_document, :type_source, :province].map{|c| options[c] }.reject(&:empty?)
  #
  #     #categories << options[:theme].to_i << options[:type_document].to_i <<
  #     #  options[:type_source].to_i << options[:province].to_i
  #     #categories.delete(0) # removing blank categories
  #     # fail
  #     Sunspot.search(Report) do
  #       with(:category_ids).all_of(categories)
  #       # with(:drc_company_ids, options[:drc_company_id].to_i)
  #       keywords options[:query]
  #       order_by :actual_post_date, :desc
  #       paginate(page: params[:page], per_page: 12)
  #     end
  #   end
end
