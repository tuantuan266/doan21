require 'test_helper'

class NhanXetsControllerTest < ActionController::TestCase
  setup do
    @nhan_xet = nhan_xets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:nhan_xets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create nhan_xet" do
    assert_difference('NhanXet.count') do
      post :create, nhan_xet: { NoiDung: @nhan_xet.NoiDung, chi_tiet_binh_bau_id: @nhan_xet.chi_tiet_binh_bau_id, truong_id: @nhan_xet.truong_id, user_id: @nhan_xet.user_id }
    end

    assert_redirected_to nhan_xet_path(assigns(:nhan_xet))
  end

  test "should show nhan_xet" do
    get :show, id: @nhan_xet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @nhan_xet
    assert_response :success
  end

  test "should update nhan_xet" do
    put :update, id: @nhan_xet, nhan_xet: { NoiDung: @nhan_xet.NoiDung, chi_tiet_binh_bau_id: @nhan_xet.chi_tiet_binh_bau_id, truong_id: @nhan_xet.truong_id, user_id: @nhan_xet.user_id }
    assert_redirected_to nhan_xet_path(assigns(:nhan_xet))
  end

  test "should destroy nhan_xet" do
    assert_difference('NhanXet.count', -1) do
      delete :destroy, id: @nhan_xet
    end

    assert_redirected_to nhan_xets_path
  end
end
