json.array!(@design_engineerings) do |design_engineering|
  json.extract! design_engineering, :id, :title, :description
  json.url design_engineering_url(design_engineering, format: :json)
end
