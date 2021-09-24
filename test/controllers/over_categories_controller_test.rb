require "test_helper"

class OverCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @over_category = over_categories(:one)
  end

  test "should get index" do
    get over_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_over_category_url
    assert_response :success
  end

  test "should create over_category" do
    assert_difference('OverCategory.count') do
      post over_categories_url, params: { over_category: { name: @over_category.name } }
    end

    assert_redirected_to over_category_url(OverCategory.last)
  end

  test "should show over_category" do
    get over_category_url(@over_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_over_category_url(@over_category)
    assert_response :success
  end

  test "should update over_category" do
    patch over_category_url(@over_category), params: { over_category: { name: @over_category.name } }
    assert_redirected_to over_category_url(@over_category)
  end

  test "should destroy over_category" do
    assert_difference('OverCategory.count', -1) do
      delete over_category_url(@over_category)
    end

    assert_redirected_to over_categories_url
  end
end
