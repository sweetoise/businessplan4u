json.array!(@solutions) do |solution|
  json.extract! solution, :id, :title, :description
  json.url solution_url(solution, format: :json)
end
