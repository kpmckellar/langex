json.array!(@unis) do |uni|
  json.extract! uni, :id, :name, :city, :neighborhood
  json.url uni_url(uni, format: :json)
end
