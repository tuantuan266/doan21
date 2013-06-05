require 'test_helper'

class TruongsControllerTest < ActionController::TestCase
  setup do
    @truong = truongs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:truongs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create truong" do
    assert_difference('Truong.count') do
      post :create, truong: { GioiThieu: @truong.GioiThieu, LienLac: @truong.LienLac, Logo: @truong.Logo, TenTruong: @truong.TenTruong, ToaDo: @truong.ToaDo }
    end

    assert_redirected_to truong_path(assigns(:truong))
  end

  test "should show truong" do
    get :show, id: @truong
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @truong
    assert_response :success
  end

  test "should update truong" do
    put :update, id: @truong, truong: { GioiThieu: @truong.GioiThieu, LienLac: @truong.LienLac, Logo: @truong.Logo, TenTruong: @truong.TenTruong, ToaDo: @truong.ToaDo }
    assert_redirected_to truong_path(assigns(:truong))
  end

  test "should destroy truong" do
    assert_difference('Truong.count', -1) do
      delete :destroy, id: @truong
    end

    assert_redirected_to truongs_path
  end
end
