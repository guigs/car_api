require 'test_helper'

class LocationsControllerTest < ActionDispatch::IntegrationTest
  test "should require location param" do
    assert_raises(ActionController::ParameterMissing) do
      get cars_url
    end
  end

  test "should return cars json in correct format" do
    get cars_url, params: { location: '51.5444204,-0.22707' }
    assert_response :success
    json = JSON.parse(response.body)
    assert(json.has_key?("cars"))
    assert_equal(['description', 'latitude', 'longitude'].to_set, json["cars"].first.keys.to_set)
  end
end
