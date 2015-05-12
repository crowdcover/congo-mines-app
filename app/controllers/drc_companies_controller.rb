class DrcCompaniesController < ApplicationController

  def show
    @drc_company = DrcCompany.includes(:tax_obligations, :employees,
      :env_and_social_obligations, :flows_payable_under_contracts,
      :production_exports).find(params[:id])
    render :show
  end

  def index
    # make one ivar for all companies for select dropdown
    # make one ivar for paginated list
    @all_drc_companies = DrcCompany.all
    @drc_companies = DrcCompany.all.page params[:page]
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
