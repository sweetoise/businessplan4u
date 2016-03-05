json.array!(@our_advantages) do |our_advantage|
  json.extract! our_advantage, :id, :title, :description
  json.url our_advantage_url(our_advantage, format: :json)
end
