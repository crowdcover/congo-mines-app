class DrcCompaniesController < ApplicationController
  before_filter :get_map_page, only: :show

  def show
    @drc_company = DrcCompany.includes(:tax_obligations,
      :env_and_social_obligations).find(params[:id])
    # render json: @congolese_company
    # map_page = true
    render :show
  end

  def index
    @drc_companies = DrcCompany.all
    render json: @drc_companies
  end

  private
  def get_map_page
    @map_page = true
  end

  def drc_company_params
  end
end
