require 'test_helper'

class TaxObligationsControllerTest < ActionController::TestCase
  setup do
    @tax_obligation = tax_obligations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tax_obligations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tax_obligation" do
    assert_difference('TaxObligation.count') do
      post :create, tax_obligation: { amount_for_transfer_of_shares: @tax_obligation.amount_for_transfer_of_shares, congolese_company_id: @tax_obligation.congolese_company_id, declared_IBP: @tax_obligation.declared_IBP, declared_customs_duty_on_imports: @tax_obligation.declared_customs_duty_on_imports, declared_royalties: @tax_obligation.declared_royalties, formula_of: @tax_obligation.formula_of, formula_of_annuity_or_rent_to_pay: @tax_obligation.formula_of_annuity_or_rent_to_pay, other_contractual_flows_reported: @tax_obligation.other_contractual_flows_reported, recipient_of_the_contractual_cash_flows: @tax_obligation.recipient_of_the_contractual_cash_flows, royalties: @tax_obligation.royalties, royalties_payable: @tax_obligation.royalties_payable, signature_bonus_declared: @tax_obligation.signature_bonus_declared, signature_bonus_payable: @tax_obligation.signature_bonus_payable, surface_rights_declared: @tax_obligation.surface_rights_declared, total_amount_paid_according_to_company_EITI_declaration: @tax_obligation.total_amount_paid_according_to_company_EITI_declaration, year: @tax_obligation.year }
    end

    assert_redirected_to tax_obligation_path(assigns(:tax_obligation))
  end

  test "should show tax_obligation" do
    get :show, id: @tax_obligation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tax_obligation
    assert_response :success
  end

  test "should update tax_obligation" do
    patch :update, id: @tax_obligation, tax_obligation: { amount_for_transfer_of_shares: @tax_obligation.amount_for_transfer_of_shares, congolese_company_id: @tax_obligation.congolese_company_id, declared_IBP: @tax_obligation.declared_IBP, declared_customs_duty_on_imports: @tax_obligation.declared_customs_duty_on_imports, declared_royalties: @tax_obligation.declared_royalties, formula_of: @tax_obligation.formula_of, formula_of_annuity_or_rent_to_pay: @tax_obligation.formula_of_annuity_or_rent_to_pay, other_contractual_flows_reported: @tax_obligation.other_contractual_flows_reported, recipient_of_the_contractual_cash_flows: @tax_obligation.recipient_of_the_contractual_cash_flows, royalties: @tax_obligation.royalties, royalties_payable: @tax_obligation.royalties_payable, signature_bonus_declared: @tax_obligation.signature_bonus_declared, signature_bonus_payable: @tax_obligation.signature_bonus_payable, surface_rights_declared: @tax_obligation.surface_rights_declared, total_amount_paid_according_to_company_EITI_declaration: @tax_obligation.total_amount_paid_according_to_company_EITI_declaration, year: @tax_obligation.year }
    assert_redirected_to tax_obligation_path(assigns(:tax_obligation))
  end

  test "should destroy tax_obligation" do
    assert_difference('TaxObligation.count', -1) do
      delete :destroy, id: @tax_obligation
    end

    assert_redirected_to tax_obligations_path
  end
end
