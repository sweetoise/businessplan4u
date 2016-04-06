json.array!(@entrepreneur_programs) do |entrepreneur_program|
  json.extract! entrepreneur_program, :id, :topic, :description
  json.url entrepreneur_program_url(entrepreneur_program, format: :json)
end
