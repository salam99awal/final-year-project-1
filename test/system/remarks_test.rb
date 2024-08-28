require "application_system_test_case"

class RemarksTest < ApplicationSystemTestCase
  setup do
    @remark = remarks(:one)
  end

  test "visiting the index" do
    visit remarks_url
    assert_selector "h1", text: "Remarks"
  end

  test "creating a Remark" do
    visit remarks_url
    click_on "New Remark"

    fill_in "Student", with: @remark.student_id
    fill_in "Teacher", with: @remark.teacher_id
    fill_in "Teacher remark", with: @remark.teacher_remark
    click_on "Create Remark"

    assert_text "Remark was successfully created"
    click_on "Back"
  end

  test "updating a Remark" do
    visit remarks_url
    click_on "Edit", match: :first

    fill_in "Student", with: @remark.student_id
    fill_in "Teacher", with: @remark.teacher_id
    fill_in "Teacher remark", with: @remark.teacher_remark
    click_on "Update Remark"

    assert_text "Remark was successfully updated"
    click_on "Back"
  end

  test "destroying a Remark" do
    visit remarks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Remark was successfully destroyed"
  end
end
