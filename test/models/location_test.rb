require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  test "get closest locations" do
    assert_equal([locations(:one), locations(:two)], Location.closest(-0.32, 51.23))
    assert_equal([locations(:two), locations(:one)], Location.closest(-0.35, 51.24))
  end
end
