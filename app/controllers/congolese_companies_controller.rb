class CongoleseCompaniesController < ApplicationController

  def show
    @congolese_company = CongoleseCompany.find(params[:id])
    render :show
  end

  def index
    @congolese_companies = CongoleseCompany.all
    render json: @congolese_companies
  end

  private
  def congolese_company_params
    params.require(:congolese_company).permit(:name, :website, :project_type)
  end

end
