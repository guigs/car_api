class Location < ApplicationRecord
  GEO_FACTORY = RGeo::Geographic.spherical_factory(srid: 4326)
end
