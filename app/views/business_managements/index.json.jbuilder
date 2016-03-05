json.array!(@business_managements) do |business_management|
  json.extract! business_management, :id, :title, :description
  json.url business_management_url(business_management, format: :json)
end
