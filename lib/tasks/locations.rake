namespace :car_api do
  namespace :locations  do
    desc "import locations from json data file"
    task import: :environment do
      ImportLocations.new(Rails.root.join('data.json')).run
    end
  end
end
