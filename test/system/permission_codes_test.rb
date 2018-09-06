require "application_system_test_case"

class PermissionCodesTest < ApplicationSystemTestCase
  setup do
    @permission_code = permission_codes(:one)
  end

  test "visiting the index" do
    visit permission_codes_url
    assert_selector "h1", text: "Permission Codes"
  end

  test "creating a Permission code" do
    visit permission_codes_url
    click_on "New Permission Code"

    fill_in "Body", with: @permission_code.body
    fill_in "Role", with: @permission_code.role
    click_on "Create Permission code"

    assert_text "Permission code was successfully created"
    click_on "Back"
  end

  test "updating a Permission code" do
    visit permission_codes_url
    click_on "Edit", match: :first

    fill_in "Body", with: @permission_code.body
    fill_in "Role", with: @permission_code.role
    click_on "Update Permission code"

    assert_text "Permission code was successfully updated"
    click_on "Back"
  end

  test "destroying a Permission code" do
    visit permission_codes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Permission code was successfully destroyed"
  end
end
