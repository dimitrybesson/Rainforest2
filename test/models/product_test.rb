require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
    @product = build(:product)
  end

  test "should be invalid without a name" do
    @product.name = nil
    assert_nil @product.name

    assert_equal false, @product.valid?
  end

  test "should be invalid without a description" do
    @product.description = nil
    assert_nil @product.description

    assert_equal false, @product.valid?
  end

  #4
  test "product's price is an integer" do
    @product.price_in_cents = 5.0
    assert_equal false, @product.valid?

    @product.price_in_cents = 5
    assert_equal true, @product.valid?

    @product.price_in_cents = 0
    assert_equal true, @product.valid?
  end

  #5
  test "product has formatted price" do
    @product.price_in_cents = 0
    assert_equal '0.00', @product.formatted_price

    @product.price_in_cents = 150
    assert_equal '1.50', @product.formatted_price
  end

  #6
  test "product can have many reviews" do
    @product.reviews.build(comment: "", user_id: 1)
    @product.reviews.build(comment: "", user_id: 1)
    @product.save

    assert_equal 2, @product.reviews.count
  end
end
