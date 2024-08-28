require "application_system_test_case"

class CollectFeesTest < ApplicationSystemTestCase
  setup do
    @collect_fee = collect_fees(:one)
  end

  test "visiting the index" do
    visit collect_fees_url
    assert_selector "h1", text: "Collect Fees"
  end

  test "creating a Collect fee" do
    visit collect_fees_url
    click_on "New Collect Fee"

    fill_in "Amount received", with: @collect_fee.amount_received
    fill_in "Student", with: @collect_fee.student_id
    fill_in "User", with: @collect_fee.user_id
    click_on "Create Collect fee"

    assert_text "Collect fee was successfully created"
    click_on "Back"
  end

  test "updating a Collect fee" do
    visit collect_fees_url
    click_on "Edit", match: :first

    fill_in "Amount received", with: @collect_fee.amount_received
    fill_in "Student", with: @collect_fee.student_id
    fill_in "User", with: @collect_fee.user_id
    click_on "Update Collect fee"

    assert_text "Collect fee was successfully updated"
    click_on "Back"
  end

  test "destroying a Collect fee" do
    visit collect_fees_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Collect fee was successfully destroyed"
  end
end
