# frozen_string_literal: true

# Companies
class DrcCompaniesController < ApplicationController
  before_action :company, only: [:show]
  before_action :employees_by_year, only: [:show]
  before_action :production_exports_by_year, only: [:show]
  before_action :tax_obligations_by_year, only: [:show]

  def show
    @drc_company_reports = @drc_company.reports.order(actual_post_date: :desc)
                                       .page(params[:page]).per(12)
  end

  def company
    @drc_company = DrcCompany.includes(
      :tax_obligations, :employees, :deposits, :processing_infrastructures, :social_projects,
      :env_and_social_obligation, :flows_payable_under_contract,
      :production_exports
    ).find(params[:id])
  end

  def employees_by_year
    @drc_company_employees_years = []
    @drc_company_employees_byyear = {}
    @drc_company.employees.each do |employee|
      @year = employee.year
      unless @drc_company_employees_byyear[@year]
        @drc_company_employees_byyear[@year] = []
        @drc_company_employees_years.push(@year)
      end
      @drc_company_employees_byyear[@year].push(employee)
    end
  end

  def production_exports_by_year
    @drc_company_production_exports_years = []
    @drc_company_production_exports_byyear = {}
    @drc_company.production_exports.each do |pe|
      @year = pe.year
      unless @drc_company_production_exports_byyear[@year]
        @drc_company_production_exports_byyear[@year] = []
        @drc_company_production_exports_years.push(@year)
      end
      @drc_company_production_exports_byyear[@year].push(pe)
    end
  end

  def tax_obligations_by_year
    @drc_company_tax_obligations_years = []
    @drc_company_tax_obligations_byyear = {}
    @drc_company.tax_obligations.each do |to|
      @year = to.year
      unless @drc_company_tax_obligations_byyear[@year]
        @drc_company_tax_obligations_byyear[@year] = []
        @drc_company_tax_obligations_years.push(@year)
      end
      @drc_company_tax_obligations_byyear[@year].push(to)
    end
  end

  def index
    # make one ivar for all companies for select dropdown
    # make one ivar for paginated list
    @all_drc_companies = DrcCompany.all.order('name ASC')
    @drc_companies = DrcCompany.all.order('name ASC').page params[:page]
    @all_shareholders = Shareholder.all.order('name ASC')
    @shareholders = Shareholder.all.order('name ASC').page params[:page]
    render :index
  end
  skip_before_action :verify_authenticity_token
  def get_geodata
    # get_geodata_drc_company_path(@drc_company)
    @drc_company = DrcCompany.includes(:deposits, :social_projects,
                                       :processing_infrastructures).find(params[:id])
    # render :json
  end

  def get_deposits_geodata
    @drc_company = DrcCompany.includes(:deposits).find(params[:id])
  end

  def get_social_projects_geodata
    @drc_company = DrcCompany.includes(:social_projects).find(params[:id])
  end

  def get_processing_infrastructures_geodata
    @drc_company = DrcCompany.includes(:processing_infrastructures).find(params[:id])
  end

  private

  def drc_company_params; end
end
