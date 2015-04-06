require 'test_helper'

class CongoleseCompaniesControllerTest < ActionController::TestCase
  setup do
    @congolese_company = congolese_companies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:congolese_companies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create congolese_company" do
    assert_difference('CongoleseCompany.count') do
      post :create, congolese_company: { acronym: @congolese_company.acronym, contact: @congolese_company.contact, export_value: @congolese_company.export_value, grade_percent: @congolese_company.grade_percent, legal_regime: @congolese_company.legal_regime, legal_status: @congolese_company.legal_status, metal_content: @congolese_company.metal_content, name: @congolese_company.name, nrc: @congolese_company.nrc, production_year: @congolese_company.production_year, project_phase: @congolese_company.project_phase, project_type: @congolese_company.project_type, rccm: @congolese_company.rccm, tonnage: @congolese_company.tonnage, type_of_product: @congolese_company.type_of_product, website: @congolese_company.website }
    end

    assert_redirected_to congolese_company_path(assigns(:congolese_company))
  end

  test "should show congolese_company" do
    get :show, id: @congolese_company
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @congolese_company
    assert_response :success
  end

  test "should update congolese_company" do
    patch :update, id: @congolese_company, congolese_company: { acronym: @congolese_company.acronym, contact: @congolese_company.contact, export_value: @congolese_company.export_value, grade_percent: @congolese_company.grade_percent, legal_regime: @congolese_company.legal_regime, legal_status: @congolese_company.legal_status, metal_content: @congolese_company.metal_content, name: @congolese_company.name, nrc: @congolese_company.nrc, production_year: @congolese_company.production_year, project_phase: @congolese_company.project_phase, project_type: @congolese_company.project_type, rccm: @congolese_company.rccm, tonnage: @congolese_company.tonnage, type_of_product: @congolese_company.type_of_product, website: @congolese_company.website }
    assert_redirected_to congolese_company_path(assigns(:congolese_company))
  end

  test "should destroy congolese_company" do
    assert_difference('CongoleseCompany.count', -1) do
      delete :destroy, id: @congolese_company
    end

    assert_redirected_to congolese_companies_path
  end
end
