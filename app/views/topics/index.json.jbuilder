json.array!(@topics) do |topic|
  json.extract! topic, :id, :user_id, :language_id, :level, :tags_id, :title, :body, :approved
  json.url topic_url(topic, format: :json)
end
