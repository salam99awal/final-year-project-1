require "application_system_test_case"

class AssessmentMastersTest < ApplicationSystemTestCase
  setup do
    @assessment_master = assessment_masters(:one)
  end

  test "visiting the index" do
    visit assessment_masters_url
    assert_selector "h1", text: "Assessment Masters"
  end

  test "creating a Assessment master" do
    visit assessment_masters_url
    click_on "New Assessment Master"

    fill_in "Name", with: @assessment_master.name
    click_on "Create Assessment master"

    assert_text "Assessment master was successfully created"
    click_on "Back"
  end

  test "updating a Assessment master" do
    visit assessment_masters_url
    click_on "Edit", match: :first

    fill_in "Name", with: @assessment_master.name
    click_on "Update Assessment master"

    assert_text "Assessment master was successfully updated"
    click_on "Back"
  end

  test "destroying a Assessment master" do
    visit assessment_masters_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Assessment master was successfully destroyed"
  end
end
