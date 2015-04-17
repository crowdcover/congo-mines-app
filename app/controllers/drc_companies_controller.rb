class DrcCompaniesController < ApplicationController

  def show
    @drc_company = DrcCompany.includes(:tax_obligations,
      :env_and_social_obligations).find(params[:id])
    # render json: @congolese_company
    render :show
  end

  def index
    @drc_companies = DrcCompany.all
    render json: @drc_companies
  end

  private
  def drc_company_params
  end

end
