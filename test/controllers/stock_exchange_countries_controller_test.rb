require 'test_helper'

class StockExchangeCountriesControllerTest < ActionController::TestCase
  setup do
    @stock_exchange_country = stock_exchange_countries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stock_exchange_countries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stock_exchange_country" do
    assert_difference('StockExchangeCountry.count') do
      post :create, stock_exchange_country: { name: @stock_exchange_country.name }
    end

    assert_redirected_to stock_exchange_country_path(assigns(:stock_exchange_country))
  end

  test "should show stock_exchange_country" do
    get :show, id: @stock_exchange_country
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @stock_exchange_country
    assert_response :success
  end

  test "should update stock_exchange_country" do
    patch :update, id: @stock_exchange_country, stock_exchange_country: { name: @stock_exchange_country.name }
    assert_redirected_to stock_exchange_country_path(assigns(:stock_exchange_country))
  end

  test "should destroy stock_exchange_country" do
    assert_difference('StockExchangeCountry.count', -1) do
      delete :destroy, id: @stock_exchange_country
    end

    assert_redirected_to stock_exchange_countries_path
  end
end
