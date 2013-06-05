require 'test_helper'

class ChiTietTruongsControllerTest < ActionController::TestCase
  setup do
    @chi_tiet_truong = chi_tiet_truongs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:chi_tiet_truongs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create chi_tiet_truong" do
    assert_difference('ChiTietTruong.count') do
      post :create, chi_tiet_truong: { chi_tiet_binh_bau_id: @chi_tiet_truong.chi_tiet_binh_bau_id, truong_id: @chi_tiet_truong.truong_id }
    end

    assert_redirected_to chi_tiet_truong_path(assigns(:chi_tiet_truong))
  end

  test "should show chi_tiet_truong" do
    get :show, id: @chi_tiet_truong
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @chi_tiet_truong
    assert_response :success
  end

  test "should update chi_tiet_truong" do
    put :update, id: @chi_tiet_truong, chi_tiet_truong: { chi_tiet_binh_bau_id: @chi_tiet_truong.chi_tiet_binh_bau_id, truong_id: @chi_tiet_truong.truong_id }
    assert_redirected_to chi_tiet_truong_path(assigns(:chi_tiet_truong))
  end

  test "should destroy chi_tiet_truong" do
    assert_difference('ChiTietTruong.count', -1) do
      delete :destroy, id: @chi_tiet_truong
    end

    assert_redirected_to chi_tiet_truongs_path
  end
end
