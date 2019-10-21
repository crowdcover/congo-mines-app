# frozen_string_literal: true

# Categories
class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @category_reports = @category.reports.page(params[:page]).per(12)
  end
end
