class CongoleseCompaniesController < ApplicationController

  def show
    @congolese_company = CongoleseCompany.includes(:tax_obligations,
      :env_and_social_obligations).find(params[:id])
    # render json: @congolese_company
    render :show
  end

  def index
    @congolese_companies = CongoleseCompany.all
    render json: @congolese_companies
  end

  private
  def congolese_company_params
    params.require(:congolese_company).permit(:name, :acronym, :nrc, :rccm,
      :contact, :website, :legal_status, :project_type, :project_phase,
      :legal_regime, :production_year, :type_of_product, :tonnage, :grade_percent,
      :metal_content, :export_value,
      :tax_obligations, :env_and_social_obligations
      )
  end

end
