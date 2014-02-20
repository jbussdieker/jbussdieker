json.array!(@apartments) do |apartment|
  json.extract! apartment, :id, :url, :description, :price, :longitude, :latitude
  json.url apartment_url(apartment, format: :json)
end
