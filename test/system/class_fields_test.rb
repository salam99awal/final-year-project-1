require "application_system_test_case"

class ClassFieldsTest < ApplicationSystemTestCase
  setup do
    @class_field = class_fields(:one)
  end

  test "visiting the index" do
    visit class_fields_url
    assert_selector "h1", text: "Class Fields"
  end

  test "creating a Class field" do
    visit class_fields_url
    click_on "New Class Field"

    fill_in "Name", with: @class_field.name
    click_on "Create Class field"

    assert_text "Class field was successfully created"
    click_on "Back"
  end

  test "updating a Class field" do
    visit class_fields_url
    click_on "Edit", match: :first

    fill_in "Name", with: @class_field.name
    click_on "Update Class field"

    assert_text "Class field was successfully updated"
    click_on "Back"
  end

  test "destroying a Class field" do
    visit class_fields_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Class field was successfully destroyed"
  end
end
