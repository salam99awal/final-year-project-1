require 'test_helper'

class AssessmentMastersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @assessment_master = assessment_masters(:one)
  end

  test "should get index" do
    get assessment_masters_url
    assert_response :success
  end

  test "should get new" do
    get new_assessment_master_url
    assert_response :success
  end

  test "should create assessment_master" do
    assert_difference('AssessmentMaster.count') do
      post assessment_masters_url, params: { assessment_master: { name: @assessment_master.name } }
    end

    assert_redirected_to assessment_master_url(AssessmentMaster.last)
  end

  test "should show assessment_master" do
    get assessment_master_url(@assessment_master)
    assert_response :success
  end

  test "should get edit" do
    get edit_assessment_master_url(@assessment_master)
    assert_response :success
  end

  test "should update assessment_master" do
    patch assessment_master_url(@assessment_master), params: { assessment_master: { name: @assessment_master.name } }
    assert_redirected_to assessment_master_url(@assessment_master)
  end

  test "should destroy assessment_master" do
    assert_difference('AssessmentMaster.count', -1) do
      delete assessment_master_url(@assessment_master)
    end

    assert_redirected_to assessment_masters_url
  end
end
