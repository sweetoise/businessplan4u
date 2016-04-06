json.array!(@recent_projects) do |recent_project|
  json.extract! recent_project, :id, :title, :description
  json.url recent_project_url(recent_project, format: :json)
end
