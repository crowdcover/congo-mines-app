# frozen_string_literal: true

require 'test_helper'

class ProductionExportsControllerTest < ActionController::TestCase
  setup do
    @production_export = production_exports(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:production_exports)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create production_export' do
    assert_difference('ProductionExport.count') do
      post :create, production_export: { congolese_company_id: @production_export.congolese_company_id, export_value: @production_export.export_value, grade: @production_export.grade, metal_content: @production_export.metal_content, tonnage: @production_export.tonnage, type_of_product: @production_export.type_of_product, year: @production_export.year }
    end

    assert_redirected_to production_export_path(assigns(:production_export))
  end

  test 'should show production_export' do
    get :show, id: @production_export
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @production_export
    assert_response :success
  end

  test 'should update production_export' do
    patch :update, id: @production_export, production_export: { congolese_company_id: @production_export.congolese_company_id, export_value: @production_export.export_value, grade: @production_export.grade, metal_content: @production_export.metal_content, tonnage: @production_export.tonnage, type_of_product: @production_export.type_of_product, year: @production_export.year }
    assert_redirected_to production_export_path(assigns(:production_export))
  end

  test 'should destroy production_export' do
    assert_difference('ProductionExport.count', -1) do
      delete :destroy, id: @production_export
    end

    assert_redirected_to production_exports_path
  end
end
