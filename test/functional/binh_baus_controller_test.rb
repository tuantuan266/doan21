require 'test_helper'

class BinhBausControllerTest < ActionController::TestCase
  setup do
    @binh_bau = binh_baus(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:binh_baus)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create binh_bau" do
    assert_difference('BinhBau.count') do
      post :create, binh_bau: { Active: @binh_bau.Active, MaxSao: @binh_bau.MaxSao, MoTaBinhBau: @binh_bau.MoTaBinhBau, NgayBatDau: @binh_bau.NgayBatDau, NgayKetThuc: @binh_bau.NgayKetThuc, TenBinhBau: @binh_bau.TenBinhBau }
    end

    assert_redirected_to binh_bau_path(assigns(:binh_bau))
  end

  test "should show binh_bau" do
    get :show, id: @binh_bau
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @binh_bau
    assert_response :success
  end

  test "should update binh_bau" do
    put :update, id: @binh_bau, binh_bau: { Active: @binh_bau.Active, MaxSao: @binh_bau.MaxSao, MoTaBinhBau: @binh_bau.MoTaBinhBau, NgayBatDau: @binh_bau.NgayBatDau, NgayKetThuc: @binh_bau.NgayKetThuc, TenBinhBau: @binh_bau.TenBinhBau }
    assert_redirected_to binh_bau_path(assigns(:binh_bau))
  end

  test "should destroy binh_bau" do
    assert_difference('BinhBau.count', -1) do
      delete :destroy, id: @binh_bau
    end

    assert_redirected_to binh_baus_path
  end
end
