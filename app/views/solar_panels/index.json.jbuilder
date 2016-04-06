json.array!(@solar_panels) do |solar_panel|
  json.extract! solar_panel, :id, :title, :description
  json.url solar_panel_url(solar_panel, format: :json)
end
