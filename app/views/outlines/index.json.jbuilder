json.array!(@outlines) do |outline|
  json.extract! outline, :id, :question, :entrepreneur_program_id
  json.url outline_url(outline, format: :json)
end
