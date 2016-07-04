json.array!(@waitlist_requests) do |waitlist_request|
  json.extract! waitlist_request, :id, :first_name, :last_name, :email, :native_language, :learning_language, :city, :country
  json.url waitlist_request_url(waitlist_request, format: :json)
end
