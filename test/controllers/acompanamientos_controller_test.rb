require 'test_helper'

class AcompanamientosControllerTest < ActionController::TestCase
  setup do
    @acompanamiento = acompanamientos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:acompanamientos)
  end

  test "should create acompanamiento" do
    assert_difference('Acompanamiento.count') do
      post :create, acompanamiento: { acompanamientos: @acompanamiento.acompanamientos, dia: @acompanamiento.dia, semana: @acompanamiento.semana, soda_id: @acompanamiento.soda_id }
    end

    assert_response 201
  end

  test "should show acompanamiento" do
    get :show, id: @acompanamiento
    assert_response :success
  end

  test "should update acompanamiento" do
    put :update, id: @acompanamiento, acompanamiento: { acompanamientos: @acompanamiento.acompanamientos, dia: @acompanamiento.dia, semana: @acompanamiento.semana, soda_id: @acompanamiento.soda_id }
    assert_response 204
  end

  test "should destroy acompanamiento" do
    assert_difference('Acompanamiento.count', -1) do
      delete :destroy, id: @acompanamiento
    end

    assert_response 204
  end
end
