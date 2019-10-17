require 'test_helper'

class MultinationalCompaniesControllerTest < ActionController::TestCase
  setup do
    @multinational_company = multinational_companies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:multinational_companies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create multinational_company" do
    assert_difference('MultinationalCompany.count') do
      post :create, multinational_company: { acronym: @multinational_company.acronym, contact: @multinational_company.contact, listed: @multinational_company.listed, market: @multinational_company.market, name: @multinational_company.name, on: @multinational_company.on, stock: @multinational_company.stock, stock_information: @multinational_company.stock_information, stock_symbol: @multinational_company.stock_symbol, website: @multinational_company.website }
    end

    assert_redirected_to multinational_company_path(assigns(:multinational_company))
  end

  test "should show multinational_company" do
    get :show, id: @multinational_company
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @multinational_company
    assert_response :success
  end

  test "should update multinational_company" do
    patch :update, id: @multinational_company, multinational_company: { acronym: @multinational_company.acronym, contact: @multinational_company.contact, listed: @multinational_company.listed, market: @multinational_company.market, name: @multinational_company.name, on: @multinational_company.on, stock: @multinational_company.stock, stock_information: @multinational_company.stock_information, stock_symbol: @multinational_company.stock_symbol, website: @multinational_company.website }
    assert_redirected_to multinational_company_path(assigns(:multinational_company))
  end

  test "should destroy multinational_company" do
    assert_difference('MultinationalCompany.count', -1) do
      delete :destroy, id: @multinational_company
    end

    assert_redirected_to multinational_companies_path
  end
end
