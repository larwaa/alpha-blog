require "test_helper"

class CategoryTest < ActiveSupport::TestCase

  def setup
    @category = Category.new(name: "sports")
  end

  test "set category" do
    assert @category.valid?
  end

  test "name must be present" do
    @category.name = ""
    assert_not @category.valid?
  end

  test "name shorter than or equal to 30 characters" do
    @category.name = "a"*31
    assert_not @category.valid?
  end

  test "name uniqueness" do
    @category.save
    category2 = Category.new(name: "sports")
    assert_not category2.valid?
  end

  test "name longer than or equal to 3 characters" do
    @category.name = "a"
    assert_not @category.valid?
  end

end