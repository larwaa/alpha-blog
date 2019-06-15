require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @category = Category.create(name: "food")
  end

  test "categories index route" do
    get categories_path
    assert_response :success
  end

  test "categories new route not admin" do
    get new_category_path
    assert_response :redirect
  end

  test "categories new route admin" do
    admin_sign_in
    get new_category_path
    assert_response :success
    assert_template "admin/categories/new"
  end

  test "categories show route" do
    get category_path(@category)
    assert_response :success
  end

  test "require admin" do
    assert_no_difference "Category.count" do
      post categories_path, params: {category: {name: "food"}}
    end
    assert_redirected_to root_path
  end

end