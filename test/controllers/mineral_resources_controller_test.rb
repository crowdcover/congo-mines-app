require 'test_helper'

class MineralResourcesControllerTest < ActionController::TestCase
  setup do
    @mineral_resource = mineral_resources(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mineral_resources)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mineral_resource" do
    assert_difference('MineralResource.count') do
      post :create, mineral_resource: { name: @mineral_resource.name }
    end

    assert_redirected_to mineral_resource_path(assigns(:mineral_resource))
  end

  test "should show mineral_resource" do
    get :show, id: @mineral_resource
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mineral_resource
    assert_response :success
  end

  test "should update mineral_resource" do
    patch :update, id: @mineral_resource, mineral_resource: { name: @mineral_resource.name }
    assert_redirected_to mineral_resource_path(assigns(:mineral_resource))
  end

  test "should destroy mineral_resource" do
    assert_difference('MineralResource.count', -1) do
      delete :destroy, id: @mineral_resource
    end

    assert_redirected_to mineral_resources_path
  end
end
