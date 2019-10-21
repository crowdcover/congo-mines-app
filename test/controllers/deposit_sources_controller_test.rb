# frozen_string_literal: true

require 'test_helper'

class DepositSourcesControllerTest < ActionController::TestCase
  setup do
    @deposit_source = deposit_sources(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:deposit_sources)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create deposit_source' do
    assert_difference('DepositSource.count') do
      post :create, deposit_source: { name: @deposit_source.name }
    end

    assert_redirected_to deposit_source_path(assigns(:deposit_source))
  end

  test 'should show deposit_source' do
    get :show, id: @deposit_source
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @deposit_source
    assert_response :success
  end

  test 'should update deposit_source' do
    patch :update, id: @deposit_source, deposit_source: { name: @deposit_source.name }
    assert_redirected_to deposit_source_path(assigns(:deposit_source))
  end

  test 'should destroy deposit_source' do
    assert_difference('DepositSource.count', -1) do
      delete :destroy, id: @deposit_source
    end

    assert_redirected_to deposit_sources_path
  end
end
