require 'test_helper'

class ShareholderRelationshipsControllerTest < ActionController::TestCase
  setup do
    @shareholder_relationship = shareholder_relationships(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shareholder_relationships)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shareholder_relationship" do
    assert_difference('ShareholderRelationship.count') do
      post :create, shareholder_relationship: { congolese_company_id: @shareholder_relationship.congolese_company_id, multinational_company_id: @shareholder_relationship.multinational_company_id, shareholder_id: @shareholder_relationship.shareholder_id }
    end

    assert_redirected_to shareholder_relationship_path(assigns(:shareholder_relationship))
  end

  test "should show shareholder_relationship" do
    get :show, id: @shareholder_relationship
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shareholder_relationship
    assert_response :success
  end

  test "should update shareholder_relationship" do
    patch :update, id: @shareholder_relationship, shareholder_relationship: { congolese_company_id: @shareholder_relationship.congolese_company_id, multinational_company_id: @shareholder_relationship.multinational_company_id, shareholder_id: @shareholder_relationship.shareholder_id }
    assert_redirected_to shareholder_relationship_path(assigns(:shareholder_relationship))
  end

  test "should destroy shareholder_relationship" do
    assert_difference('ShareholderRelationship.count', -1) do
      delete :destroy, id: @shareholder_relationship
    end

    assert_redirected_to shareholder_relationships_path
  end
end
