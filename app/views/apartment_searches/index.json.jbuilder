json.array!(@apartment_searches) do |apartment_search|
  json.extract! apartment_search, :id, :user_id, :min_price, :max_price
  json.url apartment_search_url(apartment_search, format: :json)
end
