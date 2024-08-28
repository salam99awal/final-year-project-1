require "application_system_test_case"

class AssessmentsTest < ApplicationSystemTestCase
  setup do
    @assessment = assessments(:one)
  end

  test "visiting the index" do
    visit assessments_url
    assert_selector "h1", text: "Assessments"
  end

  test "creating a Assessment" do
    visit assessments_url
    click_on "New Assessment"

    fill_in "Assessment master", with: @assessment.assessment_master_id
    fill_in "Marks", with: @assessment.marks
    fill_in "Student", with: @assessment.student_id
    fill_in "Subject", with: @assessment.subject_id
    fill_in "Teacher", with: @assessment.teacher_id
    click_on "Create Assessment"

    assert_text "Assessment was successfully created"
    click_on "Back"
  end

  test "updating a Assessment" do
    visit assessments_url
    click_on "Edit", match: :first

    fill_in "Assessment master", with: @assessment.assessment_master_id
    fill_in "Marks", with: @assessment.marks
    fill_in "Student", with: @assessment.student_id
    fill_in "Subject", with: @assessment.subject_id
    fill_in "Teacher", with: @assessment.teacher_id
    click_on "Update Assessment"

    assert_text "Assessment was successfully updated"
    click_on "Back"
  end

  test "destroying a Assessment" do
    visit assessments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Assessment was successfully destroyed"
  end
end
