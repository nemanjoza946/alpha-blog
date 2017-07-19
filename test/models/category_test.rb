require 'test_helper'

class CategotyTest < ActiveSupport::TestCase
  def setup
    @categoty = Category.new(name: "sports")
  end
  
  test "categoty should be valid" do
    assert @categoty.valid?
  end
  
  test "name should be present" do
    @categoty.name = " "
    assert_not @categoty.valid?
  end
  
  test "name should be unique" do
    @categoty.save
    categoty2 = Category.new(name: "sports")
    assert_not categoty2.valid?
  end
  
  test "name should not be to long" do
    @categoty.name = "a" * 26
    assert_not @categoty.valid?
  end
  
  test "name should not be to short" do
    @categoty.name = "aa"
    assert_not @categoty.valid?
  end
  
end