# frozen_string_literal: true

require 'test_helper'

class EnvAndSocialObligationsControllerTest < ActionController::TestCase
  setup do
    @env_and_social_obligation = env_and_social_obligations(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:env_and_social_obligations)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create env_and_social_obligation' do
    assert_difference('EnvAndSocialObligation.count') do
      post :create, env_and_social_obligation: { _social_programmes: @env_and_social_obligation._social_programmes, amount_Invested_in: @env_and_social_obligation.amount_Invested_in, congolese_company_id: @env_and_social_obligation.congolese_company_id, dates_of_public_consultation_as_part_of_the_environmental_impact: @env_and_social_obligation.dates_of_public_consultation_as_part_of_the_environmental_impact, establishment: @env_and_social_obligation.establishment, existence_of_a_platform_for_community_dialogue: @env_and_social_obligation.existence_of_a_platform_for_community_dialogue, link_to_environmental_impact_study: @env_and_social_obligation.link_to_environmental_impact_study, link_to_sustainable_development_plan_and_or_community_agreement: @env_and_social_obligation.link_to_sustainable_development_plan_and_or_community_agreement, number_of_direct_employees_congolese: @env_and_social_obligation.number_of_direct_employees_congolese, number_of_direct_employees_expats: @env_and_social_obligation.number_of_direct_employees_expats, number_of_subcontractors_congolese: @env_and_social_obligation.number_of_subcontractors_congolese, number_of_subcontractors_expats: @env_and_social_obligation.number_of_subcontractors_expats, of_community_funds: @env_and_social_obligation.of_community_funds, study_dates: @env_and_social_obligation.study_dates, year: @env_and_social_obligation.year }
    end

    assert_redirected_to env_and_social_obligation_path(assigns(:env_and_social_obligation))
  end

  test 'should show env_and_social_obligation' do
    get :show, id: @env_and_social_obligation
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @env_and_social_obligation
    assert_response :success
  end

  test 'should update env_and_social_obligation' do
    patch :update, id: @env_and_social_obligation, env_and_social_obligation: { _social_programmes: @env_and_social_obligation._social_programmes, amount_Invested_in: @env_and_social_obligation.amount_Invested_in, congolese_company_id: @env_and_social_obligation.congolese_company_id, dates_of_public_consultation_as_part_of_the_environmental_impact: @env_and_social_obligation.dates_of_public_consultation_as_part_of_the_environmental_impact, establishment: @env_and_social_obligation.establishment, existence_of_a_platform_for_community_dialogue: @env_and_social_obligation.existence_of_a_platform_for_community_dialogue, link_to_environmental_impact_study: @env_and_social_obligation.link_to_environmental_impact_study, link_to_sustainable_development_plan_and_or_community_agreement: @env_and_social_obligation.link_to_sustainable_development_plan_and_or_community_agreement, number_of_direct_employees_congolese: @env_and_social_obligation.number_of_direct_employees_congolese, number_of_direct_employees_expats: @env_and_social_obligation.number_of_direct_employees_expats, number_of_subcontractors_congolese: @env_and_social_obligation.number_of_subcontractors_congolese, number_of_subcontractors_expats: @env_and_social_obligation.number_of_subcontractors_expats, of_community_funds: @env_and_social_obligation.of_community_funds, study_dates: @env_and_social_obligation.study_dates, year: @env_and_social_obligation.year }
    assert_redirected_to env_and_social_obligation_path(assigns(:env_and_social_obligation))
  end

  test 'should destroy env_and_social_obligation' do
    assert_difference('EnvAndSocialObligation.count', -1) do
      delete :destroy, id: @env_and_social_obligation
    end

    assert_redirected_to env_and_social_obligations_path
  end
end
