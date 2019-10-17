require 'test_helper'

class SocialProjectsControllerTest < ActionController::TestCase
  setup do
    @social_project = social_projects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:social_projects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create social_project" do
    assert_difference('SocialProject.count') do
      post :create, social_project: { amount_planned: @social_project.amount_planned, amount_spent: @social_project.amount_spent, company: @social_project.company, description: @social_project.description, drc_company_id: @social_project.drc_company_id, project_type: @social_project.project_type, stage: @social_project.stage }
    end

    assert_redirected_to social_project_path(assigns(:social_project))
  end

  test "should show social_project" do
    get :show, id: @social_project
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @social_project
    assert_response :success
  end

  test "should update social_project" do
    patch :update, id: @social_project, social_project: { amount_planned: @social_project.amount_planned, amount_spent: @social_project.amount_spent, company: @social_project.company, description: @social_project.description, drc_company_id: @social_project.drc_company_id, project_type: @social_project.project_type, stage: @social_project.stage }
    assert_redirected_to social_project_path(assigns(:social_project))
  end

  test "should destroy social_project" do
    assert_difference('SocialProject.count', -1) do
      delete :destroy, id: @social_project
    end

    assert_redirected_to social_projects_path
  end
end
