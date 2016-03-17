class Location < ApplicationRecord
  GEO_FACTORY = RGeo::Geographic.spherical_factory(srid: 4326)

  scope :order_by_closest, ->(longitude, latitude) { order(<<-SQL) }
    ST_Distance(lonlat, 'POINT(#{longitude.to_f} #{latitude.to_f})')
  SQL

  def self.closest(longitude, latitude)
    order_by_closest(longitude, latitude).limit(10)
  end

  def longitude
    lonlat.try(:x)
  end

  def latitude
    lonlat.try(:y)
  end
end
