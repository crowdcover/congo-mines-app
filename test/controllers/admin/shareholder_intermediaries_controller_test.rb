require 'test_helper'

class Admin::ShareholderIntermediariesControllerTest < ActionController::TestCase
  setup do
    @admin_shareholder_intermediary = admin_shareholder_intermediaries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_shareholder_intermediaries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_shareholder_intermediary" do
    assert_difference('Admin::ShareholderIntermediary.count') do
      post :create, admin_shareholder_intermediary: { intermediary_company_id: @admin_shareholder_intermediary.intermediary_company_id, shareholder_relationship_id: @admin_shareholder_intermediary.shareholder_relationship_id }
    end

    assert_redirected_to admin_shareholder_intermediary_path(assigns(:admin_shareholder_intermediary))
  end

  test "should show admin_shareholder_intermediary" do
    get :show, id: @admin_shareholder_intermediary
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_shareholder_intermediary
    assert_response :success
  end

  test "should update admin_shareholder_intermediary" do
    patch :update, id: @admin_shareholder_intermediary, admin_shareholder_intermediary: { intermediary_company_id: @admin_shareholder_intermediary.intermediary_company_id, shareholder_relationship_id: @admin_shareholder_intermediary.shareholder_relationship_id }
    assert_redirected_to admin_shareholder_intermediary_path(assigns(:admin_shareholder_intermediary))
  end

  test "should destroy admin_shareholder_intermediary" do
    assert_difference('Admin::ShareholderIntermediary.count', -1) do
      delete :destroy, id: @admin_shareholder_intermediary
    end

    assert_redirected_to admin_shareholder_intermediaries_path
  end
end
