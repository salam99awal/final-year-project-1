require "application_system_test_case"

class MiscUploadsTest < ApplicationSystemTestCase
  setup do
    @misc_upload = misc_uploads(:one)
  end

  test "visiting the index" do
    visit misc_uploads_url
    assert_selector "h1", text: "Misc Uploads"
  end

  test "creating a Misc upload" do
    visit misc_uploads_url
    click_on "New Misc Upload"

    fill_in "File", with: @misc_upload.file
    fill_in "User", with: @misc_upload.user_id
    click_on "Create Misc upload"

    assert_text "Misc upload was successfully created"
    click_on "Back"
  end

  test "updating a Misc upload" do
    visit misc_uploads_url
    click_on "Edit", match: :first

    fill_in "File", with: @misc_upload.file
    fill_in "User", with: @misc_upload.user_id
    click_on "Update Misc upload"

    assert_text "Misc upload was successfully updated"
    click_on "Back"
  end

  test "destroying a Misc upload" do
    visit misc_uploads_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Misc upload was successfully destroyed"
  end
end
