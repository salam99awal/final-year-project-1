require 'test_helper'

class MiscUploadsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @misc_upload = misc_uploads(:one)
  end

  test "should get index" do
    get misc_uploads_url
    assert_response :success
  end

  test "should get new" do
    get new_misc_upload_url
    assert_response :success
  end

  test "should create misc_upload" do
    assert_difference('MiscUpload.count') do
      post misc_uploads_url, params: { misc_upload: { file: @misc_upload.file, user_id: @misc_upload.user_id } }
    end

    assert_redirected_to misc_upload_url(MiscUpload.last)
  end

  test "should show misc_upload" do
    get misc_upload_url(@misc_upload)
    assert_response :success
  end

  test "should get edit" do
    get edit_misc_upload_url(@misc_upload)
    assert_response :success
  end

  test "should update misc_upload" do
    patch misc_upload_url(@misc_upload), params: { misc_upload: { file: @misc_upload.file, user_id: @misc_upload.user_id } }
    assert_redirected_to misc_upload_url(@misc_upload)
  end

  test "should destroy misc_upload" do
    assert_difference('MiscUpload.count', -1) do
      delete misc_upload_url(@misc_upload)
    end

    assert_redirected_to misc_uploads_url
  end
end
