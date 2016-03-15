class ImportLocations
  attr_reader :json_file

  def initialize(json_file)
    @json_file = File.new(json_file)
  end

  def run
    locations.each(&method(:import_location))
  end

  private

  def json
    @json ||= JSON.parse(json_file.read)
  end

  def locations
    json['locations']
  end

  def import_location(json)
    Location.create!(
      description: json['description'],
      lonlat: Location::GEO_FACTORY.point(json['longitude'], json['latitude'])
    )
  end

end