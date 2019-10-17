require 'test_helper'

class ProcessingInfrastructuresControllerTest < ActionController::TestCase
  setup do
    @processing_infrastructure = processing_infrastructures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:processing_infrastructures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create processing_infrastructure" do
    assert_difference('ProcessingInfrastructure.count') do
      post :create, processing_infrastructure: { drc_company_id: @processing_infrastructure.drc_company_id, name: @processing_infrastructure.name }
    end

    assert_redirected_to processing_infrastructure_path(assigns(:processing_infrastructure))
  end

  test "should show processing_infrastructure" do
    get :show, id: @processing_infrastructure
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @processing_infrastructure
    assert_response :success
  end

  test "should update processing_infrastructure" do
    patch :update, id: @processing_infrastructure, processing_infrastructure: { drc_company_id: @processing_infrastructure.drc_company_id, name: @processing_infrastructure.name }
    assert_redirected_to processing_infrastructure_path(assigns(:processing_infrastructure))
  end

  test "should destroy processing_infrastructure" do
    assert_difference('ProcessingInfrastructure.count', -1) do
      delete :destroy, id: @processing_infrastructure
    end

    assert_redirected_to processing_infrastructures_path
  end
end
