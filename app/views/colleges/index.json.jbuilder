json.array!(@colleges) do |college|
  json.extract! college, :id, :name, :city, :neighborhood
  json.url college_url(college, format: :json)
end
