require 'test_helper'

class PermissionCodesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @permission_code = permission_codes(:one)
  end

  test "should get index" do
    get permission_codes_url
    assert_response :success
  end

  test "should get new" do
    get new_permission_code_url
    assert_response :success
  end

  test "should create permission_code" do
    assert_difference('PermissionCode.count') do
      post permission_codes_url, params: { permission_code: { body: @permission_code.body, role: @permission_code.role } }
    end

    assert_redirected_to permission_code_url(PermissionCode.last)
  end

  test "should show permission_code" do
    get permission_code_url(@permission_code)
    assert_response :success
  end

  test "should get edit" do
    get edit_permission_code_url(@permission_code)
    assert_response :success
  end

  test "should update permission_code" do
    patch permission_code_url(@permission_code), params: { permission_code: { body: @permission_code.body, role: @permission_code.role } }
    assert_redirected_to permission_code_url(@permission_code)
  end

  test "should destroy permission_code" do
    assert_difference('PermissionCode.count', -1) do
      delete permission_code_url(@permission_code)
    end

    assert_redirected_to permission_codes_url
  end
end
