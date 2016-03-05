json.array!(@engineering_mgmts) do |engineering_mgmt|
  json.extract! engineering_mgmt, :id, :title, :description
  json.url engineering_mgmt_url(engineering_mgmt, format: :json)
end
