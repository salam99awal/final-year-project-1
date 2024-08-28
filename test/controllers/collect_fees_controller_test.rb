require 'test_helper'

class CollectFeesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @collect_fee = collect_fees(:one)
  end

  test "should get index" do
    get collect_fees_url
    assert_response :success
  end

  test "should get new" do
    get new_collect_fee_url
    assert_response :success
  end

  test "should create collect_fee" do
    assert_difference('CollectFee.count') do
      post collect_fees_url, params: { collect_fee: { amount_received: @collect_fee.amount_received, student_id: @collect_fee.student_id, user_id: @collect_fee.user_id } }
    end

    assert_redirected_to collect_fee_url(CollectFee.last)
  end

  test "should show collect_fee" do
    get collect_fee_url(@collect_fee)
    assert_response :success
  end

  test "should get edit" do
    get edit_collect_fee_url(@collect_fee)
    assert_response :success
  end

  test "should update collect_fee" do
    patch collect_fee_url(@collect_fee), params: { collect_fee: { amount_received: @collect_fee.amount_received, student_id: @collect_fee.student_id, user_id: @collect_fee.user_id } }
    assert_redirected_to collect_fee_url(@collect_fee)
  end

  test "should destroy collect_fee" do
    assert_difference('CollectFee.count', -1) do
      delete collect_fee_url(@collect_fee)
    end

    assert_redirected_to collect_fees_url
  end
end
