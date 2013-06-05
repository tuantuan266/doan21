require 'test_helper'

class NhanXetTqsControllerTest < ActionController::TestCase
  setup do
    @nhan_xet_tq = nhan_xet_tqs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:nhan_xet_tqs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create nhan_xet_tq" do
    assert_difference('NhanXetTq.count') do
      post :create, nhan_xet_tq: { NoiDung: @nhan_xet_tq.NoiDung, binh_bau_id: @nhan_xet_tq.binh_bau_id, user_id: @nhan_xet_tq.user_id }
    end

    assert_redirected_to nhan_xet_tq_path(assigns(:nhan_xet_tq))
  end

  test "should show nhan_xet_tq" do
    get :show, id: @nhan_xet_tq
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @nhan_xet_tq
    assert_response :success
  end

  test "should update nhan_xet_tq" do
    put :update, id: @nhan_xet_tq, nhan_xet_tq: { NoiDung: @nhan_xet_tq.NoiDung, binh_bau_id: @nhan_xet_tq.binh_bau_id, user_id: @nhan_xet_tq.user_id }
    assert_redirected_to nhan_xet_tq_path(assigns(:nhan_xet_tq))
  end

  test "should destroy nhan_xet_tq" do
    assert_difference('NhanXetTq.count', -1) do
      delete :destroy, id: @nhan_xet_tq
    end

    assert_redirected_to nhan_xet_tqs_path
  end
end
