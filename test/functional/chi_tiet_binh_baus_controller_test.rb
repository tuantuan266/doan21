require 'test_helper'

class ChiTietBinhBausControllerTest < ActionController::TestCase
  setup do
    @chi_tiet_binh_bau = chi_tiet_binh_baus(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:chi_tiet_binh_baus)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create chi_tiet_binh_bau" do
    assert_difference('ChiTietBinhBau.count') do
      post :create, chi_tiet_binh_bau: { binhbau_id: @chi_tiet_binh_bau.binhbau_id, tieuchi_id: @chi_tiet_binh_bau.tieuchi_id }
    end

    assert_redirected_to chi_tiet_binh_bau_path(assigns(:chi_tiet_binh_bau))
  end

  test "should show chi_tiet_binh_bau" do
    get :show, id: @chi_tiet_binh_bau
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @chi_tiet_binh_bau
    assert_response :success
  end

  test "should update chi_tiet_binh_bau" do
    put :update, id: @chi_tiet_binh_bau, chi_tiet_binh_bau: { binhbau_id: @chi_tiet_binh_bau.binhbau_id, tieuchi_id: @chi_tiet_binh_bau.tieuchi_id }
    assert_redirected_to chi_tiet_binh_bau_path(assigns(:chi_tiet_binh_bau))
  end

  test "should destroy chi_tiet_binh_bau" do
    assert_difference('ChiTietBinhBau.count', -1) do
      delete :destroy, id: @chi_tiet_binh_bau
    end

    assert_redirected_to chi_tiet_binh_baus_path
  end
end
