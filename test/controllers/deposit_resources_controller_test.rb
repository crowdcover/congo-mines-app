# frozen_string_literal: true

require 'test_helper'

class DepositResourcesControllerTest < ActionController::TestCase
  setup do
    @deposit_resource = deposit_resources(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:deposit_resources)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create deposit_resource' do
    assert_difference('DepositResource.count') do
      post :create, deposit_resource: { deposit_id: @deposit_resource.deposit_id, grade: @deposit_resource.grade, mesurement: @deposit_resource.mesurement, metal_content: @deposit_resource.metal_content, metal_content_unit: @deposit_resource.metal_content_unit, resource: @deposit_resource.resource, tonnage: @deposit_resource.tonnage }
    end

    assert_redirected_to deposit_resource_path(assigns(:deposit_resource))
  end

  test 'should show deposit_resource' do
    get :show, id: @deposit_resource
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @deposit_resource
    assert_response :success
  end

  test 'should update deposit_resource' do
    patch :update, id: @deposit_resource, deposit_resource: { deposit_id: @deposit_resource.deposit_id, grade: @deposit_resource.grade, mesurement: @deposit_resource.mesurement, metal_content: @deposit_resource.metal_content, metal_content_unit: @deposit_resource.metal_content_unit, resource: @deposit_resource.resource, tonnage: @deposit_resource.tonnage }
    assert_redirected_to deposit_resource_path(assigns(:deposit_resource))
  end

  test 'should destroy deposit_resource' do
    assert_difference('DepositResource.count', -1) do
      delete :destroy, id: @deposit_resource
    end

    assert_redirected_to deposit_resources_path
  end
end
