require "application_system_test_case"

class OverCategoriesTest < ApplicationSystemTestCase
  setup do
    @over_category = over_categories(:one)
  end

  test "visiting the index" do
    visit over_categories_url
    assert_selector "h1", text: "Over Categories"
  end

  test "creating a Over category" do
    visit over_categories_url
    click_on "New Over Category"

    fill_in "Name", with: @over_category.name
    click_on "Create Over category"

    assert_text "Over category was successfully created"
    click_on "Back"
  end

  test "updating a Over category" do
    visit over_categories_url
    click_on "Edit", match: :first

    fill_in "Name", with: @over_category.name
    click_on "Update Over category"

    assert_text "Over category was successfully updated"
    click_on "Back"
  end

  test "destroying a Over category" do
    visit over_categories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Over category was successfully destroyed"
  end
end
