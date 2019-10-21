# frozen_string_literal: true

require 'test_helper'

class FlowsPayableUnderContractsControllerTest < ActionController::TestCase
  setup do
    @flows_payable_under_contract = flows_payable_under_contracts(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:flows_payable_under_contracts)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create flows_payable_under_contract' do
    assert_difference('FlowsPayableUnderContract.count') do
      post :create, flows_payable_under_contract: { annuity: @flows_payable_under_contract.annuity, contract_cash_recipient: @flows_payable_under_contract.contract_cash_recipient, drc_company_id: @flows_payable_under_contract.drc_company_id, royalties: @flows_payable_under_contract.royalties, signature_bonus: @flows_payable_under_contract.signature_bonus, transfer_of_shares: @flows_payable_under_contract.transfer_of_shares }
    end

    assert_redirected_to flows_payable_under_contract_path(assigns(:flows_payable_under_contract))
  end

  test 'should show flows_payable_under_contract' do
    get :show, id: @flows_payable_under_contract
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @flows_payable_under_contract
    assert_response :success
  end

  test 'should update flows_payable_under_contract' do
    patch :update, id: @flows_payable_under_contract, flows_payable_under_contract: { annuity: @flows_payable_under_contract.annuity, contract_cash_recipient: @flows_payable_under_contract.contract_cash_recipient, drc_company_id: @flows_payable_under_contract.drc_company_id, royalties: @flows_payable_under_contract.royalties, signature_bonus: @flows_payable_under_contract.signature_bonus, transfer_of_shares: @flows_payable_under_contract.transfer_of_shares }
    assert_redirected_to flows_payable_under_contract_path(assigns(:flows_payable_under_contract))
  end

  test 'should destroy flows_payable_under_contract' do
    assert_difference('FlowsPayableUnderContract.count', -1) do
      delete :destroy, id: @flows_payable_under_contract
    end

    assert_redirected_to flows_payable_under_contracts_path
  end
end
