class DrcCompaniesController < ApplicationController
  before_filter :get_map_page, only: :show

  def show
    @drc_company = DrcCompany.includes(:tax_obligations, :employees,
      :env_and_social_obligations, :flows_payable_under_contracts,
      :production_exports).find(params[:id])
    # render json: @congolese_company
    # map_page = true
    render :show
  end

  def index
    @drc_companies = DrcCompany.all
    # render json: @drc_companies
    render :index
  end

  private
  def get_map_page
    @map_page = true
  end

  def drc_company_params
  end
end
