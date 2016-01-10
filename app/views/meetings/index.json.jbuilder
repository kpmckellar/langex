json.array!(@meetings) do |meeting|
  json.extract! meeting, :id, :requestor_id, :requestee_id, :meeting_time, :accepted
  json.url meeting_url(meeting, format: :json)
end
