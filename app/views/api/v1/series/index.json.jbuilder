json.data do
	json.array!(@series) do |serie|
		json.extract! serie, :id
		json.attributes do
			json.extract! serie, :name, :value, :enabled, :default
		end
		json.links do
			json.self api_v1_series_url(serie, format: :json)
		end
	end
end
