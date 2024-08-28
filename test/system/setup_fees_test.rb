require "application_system_test_case"

class SetupFeesTest < ApplicationSystemTestCase
  setup do
    @setup_fee = setup_fees(:one)
  end

  test "visiting the index" do
    visit setup_fees_url
    assert_selector "h1", text: "Setup Fees"
  end

  test "creating a Setup fee" do
    visit setup_fees_url
    click_on "New Setup Fee"

    fill_in "Class", with: @setup_fee.class_id
    fill_in "Name", with: @setup_fee.name
    click_on "Create Setup fee"

    assert_text "Setup fee was successfully created"
    click_on "Back"
  end

  test "updating a Setup fee" do
    visit setup_fees_url
    click_on "Edit", match: :first

    fill_in "Class", with: @setup_fee.class_id
    fill_in "Name", with: @setup_fee.name
    click_on "Update Setup fee"

    assert_text "Setup fee was successfully updated"
    click_on "Back"
  end

  test "destroying a Setup fee" do
    visit setup_fees_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Setup fee was successfully destroyed"
  end
end
