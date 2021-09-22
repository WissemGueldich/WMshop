require "test_helper"

class CategoryGroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category_group = category_groups(:one)
  end

  test "should get index" do
    get category_groups_url
    assert_response :success
  end

  test "should get new" do
    get new_category_group_url
    assert_response :success
  end

  test "should create category_group" do
    assert_difference('CategoryGroup.count') do
      post category_groups_url, params: { category_group: { name: @category_group.name } }
    end

    assert_redirected_to category_group_url(CategoryGroup.last)
  end

  test "should show category_group" do
    get category_group_url(@category_group)
    assert_response :success
  end

  test "should get edit" do
    get edit_category_group_url(@category_group)
    assert_response :success
  end

  test "should update category_group" do
    patch category_group_url(@category_group), params: { category_group: { name: @category_group.name } }
    assert_redirected_to category_group_url(@category_group)
  end

  test "should destroy category_group" do
    assert_difference('CategoryGroup.count', -1) do
      delete category_group_url(@category_group)
    end

    assert_redirected_to category_groups_url
  end
end
