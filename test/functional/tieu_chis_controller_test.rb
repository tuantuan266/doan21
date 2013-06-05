require 'test_helper'

class TieuChisControllerTest < ActionController::TestCase
  setup do
    @tieu_chi = tieu_chis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tieu_chis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tieu_chi" do
    assert_difference('TieuChi.count') do
      post :create, tieu_chi: { MoTaTieuChi: @tieu_chi.MoTaTieuChi, TenTieuChi: @tieu_chi.TenTieuChi }
    end

    assert_redirected_to tieu_chi_path(assigns(:tieu_chi))
  end

  test "should show tieu_chi" do
    get :show, id: @tieu_chi
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tieu_chi
    assert_response :success
  end

  test "should update tieu_chi" do
    put :update, id: @tieu_chi, tieu_chi: { MoTaTieuChi: @tieu_chi.MoTaTieuChi, TenTieuChi: @tieu_chi.TenTieuChi }
    assert_redirected_to tieu_chi_path(assigns(:tieu_chi))
  end

  test "should destroy tieu_chi" do
    assert_difference('TieuChi.count', -1) do
      delete :destroy, id: @tieu_chi
    end

    assert_redirected_to tieu_chis_path
  end
end
