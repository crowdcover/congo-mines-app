class CongoleseCompaniesController < ApplicationController

  def show
  end

  def index
    @congolese_company = CongoleseCompany.all
    render :json
  end

  private
  def congolese_company_params
    params.require(:congolese_company).permit(:name, :website, :project_type)
  end

end
