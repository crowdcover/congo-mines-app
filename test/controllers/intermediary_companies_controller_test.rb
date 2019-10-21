# frozen_string_literal: true

require 'test_helper'

class IntermediaryCompaniesControllerTest < ActionController::TestCase
  setup do
    @intermediary_company = intermediary_companies(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:intermediary_companies)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create intermediary_company' do
    assert_difference('IntermediaryCompany.count') do
      post :create, intermediary_company: { name: @intermediary_company.name }
    end

    assert_redirected_to intermediary_company_path(assigns(:intermediary_company))
  end

  test 'should show intermediary_company' do
    get :show, id: @intermediary_company
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @intermediary_company
    assert_response :success
  end

  test 'should update intermediary_company' do
    patch :update, id: @intermediary_company, intermediary_company: { name: @intermediary_company.name }
    assert_redirected_to intermediary_company_path(assigns(:intermediary_company))
  end

  test 'should destroy intermediary_company' do
    assert_difference('IntermediaryCompany.count', -1) do
      delete :destroy, id: @intermediary_company
    end

    assert_redirected_to intermediary_companies_path
  end
end
