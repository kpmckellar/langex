json.array!(@languages_user) do |languages_user|
  json.extract! languages_user, :language_id, :user_id, :level
  json.url languages_user_url(languages_user, format: :json)
end
