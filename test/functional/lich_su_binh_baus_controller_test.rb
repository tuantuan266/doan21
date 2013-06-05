require 'test_helper'

class LichSuBinhBausControllerTest < ActionController::TestCase
  setup do
    @lich_su_binh_bau = lich_su_binh_baus(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lich_su_binh_baus)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lich_su_binh_bau" do
    assert_difference('LichSuBinhBau.count') do
      post :create, lich_su_binh_bau: { chi_tiet_truong_id: @lich_su_binh_bau.chi_tiet_truong_id, user_id: @lich_su_binh_bau.user_id }
    end

    assert_redirected_to lich_su_binh_bau_path(assigns(:lich_su_binh_bau))
  end

  test "should show lich_su_binh_bau" do
    get :show, id: @lich_su_binh_bau
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lich_su_binh_bau
    assert_response :success
  end

  test "should update lich_su_binh_bau" do
    put :update, id: @lich_su_binh_bau, lich_su_binh_bau: { chi_tiet_truong_id: @lich_su_binh_bau.chi_tiet_truong_id, user_id: @lich_su_binh_bau.user_id }
    assert_redirected_to lich_su_binh_bau_path(assigns(:lich_su_binh_bau))
  end

  test "should destroy lich_su_binh_bau" do
    assert_difference('LichSuBinhBau.count', -1) do
      delete :destroy, id: @lich_su_binh_bau
    end

    assert_redirected_to lich_su_binh_baus_path
  end
end
