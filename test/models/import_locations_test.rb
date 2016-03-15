require 'test_helper'

class ImportLocationsTest < ActiveSupport::TestCase

  test "Import locations from json file" do
    assert_difference('Location.count', 2) do
      import = ImportLocations.new(Rails.root.join('test', 'fixtures', 'files', 'data.json'))
      import.run
    end
    location = Location.last
    assert_equal('Sudbury - Williams Way', location.description)
    assert_equal(-0.315159, location.lonlat.x)
    assert_equal(51.553667, location.lonlat.y)
  end

end

