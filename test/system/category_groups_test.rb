require "application_system_test_case"

class CategoryGroupsTest < ApplicationSystemTestCase
  setup do
    @category_group = category_groups(:one)
  end

  test "visiting the index" do
    visit category_groups_url
    assert_selector "h1", text: "Category Groups"
  end

  test "creating a Category group" do
    visit category_groups_url
    click_on "New Category Group"

    fill_in "Name", with: @category_group.name
    click_on "Create Category group"

    assert_text "Category group was successfully created"
    click_on "Back"
  end

  test "updating a Category group" do
    visit category_groups_url
    click_on "Edit", match: :first

    fill_in "Name", with: @category_group.name
    click_on "Update Category group"

    assert_text "Category group was successfully updated"
    click_on "Back"
  end

  test "destroying a Category group" do
    visit category_groups_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Category group was successfully destroyed"
  end
end
