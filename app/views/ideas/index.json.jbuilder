json.array!(@ideas) do |idea|
  json.extract! idea, :id, :title, :description, :status, :vote_score, :hit_counter, :user_id
  json.url idea_url(idea, format: :json)
end
