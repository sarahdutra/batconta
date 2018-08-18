require "application_system_test_case"

class SpentsTest < ApplicationSystemTestCase
  setup do
    @spent = spents(:one)
  end

  test "visiting the index" do
    visit spents_url
    assert_selector "h1", text: "Spents"
  end

  test "creating a Spent" do
    visit spents_url
    click_on "New Spent"

    fill_in "Category", with: @spent.category
    fill_in "Description", with: @spent.description
    fill_in "Value", with: @spent.value
    click_on "Create Spent"

    assert_text "Spent was successfully created"
    click_on "Back"
  end

  test "updating a Spent" do
    visit spents_url
    click_on "Edit", match: :first

    fill_in "Category", with: @spent.category
    fill_in "Description", with: @spent.description
    fill_in "Value", with: @spent.value
    click_on "Update Spent"

    assert_text "Spent was successfully updated"
    click_on "Back"
  end

  test "destroying a Spent" do
    visit spents_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Spent was successfully destroyed"
  end
end
