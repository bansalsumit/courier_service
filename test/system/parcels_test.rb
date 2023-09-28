require "application_system_test_case"

class ParcelsTest < ApplicationSystemTestCase
  setup do
    @parcel = parcels(:one)
  end

  test "visiting the index" do
    visit parcels_url
    assert_selector "h1", text: "Parcels"
  end

  test "creating a Parcel" do
    visit parcels_url
    click_on "New Parcel"

    fill_in "Payment", with: @parcel.payment_id
    fill_in "Receiver", with: @parcel.receiver_id
    fill_in "Sender", with: @parcel.sender_id
    fill_in "Service", with: @parcel.service_id
    fill_in "Status", with: @parcel.status
    fill_in "Weight", with: @parcel.weight
    click_on "Create Parcel"

    assert_text "Parcel was successfully created"
    click_on "Back"
  end

  test "updating a Parcel" do
    visit parcels_url
    click_on "Edit", match: :first

    fill_in "Payment", with: @parcel.payment_id
    fill_in "Receiver", with: @parcel.receiver_id
    fill_in "Sender", with: @parcel.sender_id
    fill_in "Service", with: @parcel.service_id
    fill_in "Status", with: @parcel.status
    fill_in "Weight", with: @parcel.weight
    click_on "Update Parcel"

    assert_text "Parcel was successfully updated"
    click_on "Back"
  end

  test "destroying a Parcel" do
    visit parcels_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Parcel was successfully destroyed"
  end
end
