json.array!(@vegetables) do |vegetable|
  json.extract! vegetable, :id, :serial, :name, :r_name
  json.url vegetable_url(vegetable, format: :json)
end
