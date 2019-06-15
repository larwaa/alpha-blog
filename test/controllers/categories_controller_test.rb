require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @category = Category.create(name: "food")
  end

  test "categories index route" do
    get categories_path
    assert_response :success
  end

  test "categories new route" do
    get new_category_path
    assert_response :success
  end

  test "categories show route" do
    get category_path(@category)
    assert_response :success
  end

end