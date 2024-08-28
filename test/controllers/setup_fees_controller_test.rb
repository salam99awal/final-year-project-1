require 'test_helper'

class SetupFeesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @setup_fee = setup_fees(:one)
  end

  test "should get index" do
    get setup_fees_url
    assert_response :success
  end

  test "should get new" do
    get new_setup_fee_url
    assert_response :success
  end

  test "should create setup_fee" do
    assert_difference('SetupFee.count') do
      post setup_fees_url, params: { setup_fee: { class_id: @setup_fee.class_id, name: @setup_fee.name } }
    end

    assert_redirected_to setup_fee_url(SetupFee.last)
  end

  test "should show setup_fee" do
    get setup_fee_url(@setup_fee)
    assert_response :success
  end

  test "should get edit" do
    get edit_setup_fee_url(@setup_fee)
    assert_response :success
  end

  test "should update setup_fee" do
    patch setup_fee_url(@setup_fee), params: { setup_fee: { class_id: @setup_fee.class_id, name: @setup_fee.name } }
    assert_redirected_to setup_fee_url(@setup_fee)
  end

  test "should destroy setup_fee" do
    assert_difference('SetupFee.count', -1) do
      delete setup_fee_url(@setup_fee)
    end

    assert_redirected_to setup_fees_url
  end
end
