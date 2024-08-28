require "application_system_test_case"

class StudentAttendancesTest < ApplicationSystemTestCase
  setup do
    @student_attendance = student_attendances(:one)
  end

  test "visiting the index" do
    visit student_attendances_url
    assert_selector "h1", text: "Student Attendances"
  end

  test "creating a Student attendance" do
    visit student_attendances_url
    click_on "New Student Attendance"

    fill_in "Class", with: @student_attendance.class_id
    check "Present status" if @student_attendance.present_status
    fill_in "Student", with: @student_attendance.student_id
    click_on "Create Student attendance"

    assert_text "Student attendance was successfully created"
    click_on "Back"
  end

  test "updating a Student attendance" do
    visit student_attendances_url
    click_on "Edit", match: :first

    fill_in "Class", with: @student_attendance.class_id
    check "Present status" if @student_attendance.present_status
    fill_in "Student", with: @student_attendance.student_id
    click_on "Update Student attendance"

    assert_text "Student attendance was successfully updated"
    click_on "Back"
  end

  test "destroying a Student attendance" do
    visit student_attendances_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Student attendance was successfully destroyed"
  end
end
