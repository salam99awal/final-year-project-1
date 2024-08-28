require 'test_helper'

class ClassFieldsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @class_field = class_fields(:one)
  end

  test "should get index" do
    get class_fields_url
    assert_response :success
  end

  test "should get new" do
    get new_class_field_url
    assert_response :success
  end

  test "should create class_field" do
    assert_difference('ClassField.count') do
      post class_fields_url, params: { class_field: { name: @class_field.name } }
    end

    assert_redirected_to class_field_url(ClassField.last)
  end

  test "should show class_field" do
    get class_field_url(@class_field)
    assert_response :success
  end

  test "should get edit" do
    get edit_class_field_url(@class_field)
    assert_response :success
  end

  test "should update class_field" do
    patch class_field_url(@class_field), params: { class_field: { name: @class_field.name } }
    assert_redirected_to class_field_url(@class_field)
  end

  test "should destroy class_field" do
    assert_difference('ClassField.count', -1) do
      delete class_field_url(@class_field)
    end

    assert_redirected_to class_fields_url
  end
end
