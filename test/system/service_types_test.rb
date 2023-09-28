require "application_system_test_case"

class ServiceTypesTest < ApplicationSystemTestCase
  setup do
    @service_type = service_types(:one)
  end

  test "visiting the index" do
    visit service_types_url
    assert_selector "h1", text: "Service Types"
  end

  test "creating a Service type" do
    visit service_types_url
    click_on "New Service Type"

    fill_in "Cost", with: @service_type.cost
    fill_in "Name", with: @service_type.name
    click_on "Create Service type"

    assert_text "Service type was successfully created"
    click_on "Back"
  end

  test "updating a Service type" do
    visit service_types_url
    click_on "Edit", match: :first

    fill_in "Cost", with: @service_type.cost
    fill_in "Name", with: @service_type.name
    click_on "Update Service type"

    assert_text "Service type was successfully updated"
    click_on "Back"
  end

  test "destroying a Service type" do
    visit service_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Service type was successfully destroyed"
  end
end
