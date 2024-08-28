require 'test_helper'

class SubjectMastersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subject_master = subject_masters(:one)
  end

  test "should get index" do
    get subject_masters_url
    assert_response :success
  end

  test "should get new" do
    get new_subject_master_url
    assert_response :success
  end

  test "should create subject_master" do
    assert_difference('SubjectMaster.count') do
      post subject_masters_url, params: { subject_master: { name: @subject_master.name } }
    end

    assert_redirected_to subject_master_url(SubjectMaster.last)
  end

  test "should show subject_master" do
    get subject_master_url(@subject_master)
    assert_response :success
  end

  test "should get edit" do
    get edit_subject_master_url(@subject_master)
    assert_response :success
  end

  test "should update subject_master" do
    patch subject_master_url(@subject_master), params: { subject_master: { name: @subject_master.name } }
    assert_redirected_to subject_master_url(@subject_master)
  end

  test "should destroy subject_master" do
    assert_difference('SubjectMaster.count', -1) do
      delete subject_master_url(@subject_master)
    end

    assert_redirected_to subject_masters_url
  end
end
