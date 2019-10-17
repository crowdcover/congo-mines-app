require 'test_helper'

class ReportRelationsControllerTest < ActionController::TestCase
  setup do
    @report_relation = report_relations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:report_relations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create report_relation" do
    assert_difference('ReportRelation.count') do
      post :create, report_relation: { reportable_id: @report_relation.reportable_id }
    end

    assert_redirected_to report_relation_path(assigns(:report_relation))
  end

  test "should show report_relation" do
    get :show, id: @report_relation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @report_relation
    assert_response :success
  end

  test "should update report_relation" do
    patch :update, id: @report_relation, report_relation: { reportable_id: @report_relation.reportable_id }
    assert_redirected_to report_relation_path(assigns(:report_relation))
  end

  test "should destroy report_relation" do
    assert_difference('ReportRelation.count', -1) do
      delete :destroy, id: @report_relation
    end

    assert_redirected_to report_relations_path
  end
end
