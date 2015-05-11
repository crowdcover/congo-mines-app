class DrcCompaniesController < ApplicationController

  def show
    @drc_company = DrcCompany.includes(:tax_obligations, :employees,
      :env_and_social_obligations, :flows_payable_under_contracts,
      :production_exports).find(params[:id])
    # render json: @congolese_company
    # map_page = true
    render :show
  end

  def index
    @drc_companies = DrcCompany.all.page params[:page]
    # render json: @drc_companies
    render :index
  end

  def get_geodata
    #get_geodata_drc_company_path(@drc_company)
    @drc_company = DrcCompany.includes(:deposits, :social_projects,
      :processing_infrastructures).find(params[:id])
  end

  private
  def drc_company_params
  end


end
