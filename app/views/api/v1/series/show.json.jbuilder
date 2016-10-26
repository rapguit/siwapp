json.data do
	json.extract! @series, :id
	json.type "series"
	json.attributes do
		json.extract! @series, :name, :value, :enabled, :default, :first_number
	end
	json.links do
		json.self api_v1_series_url(@series, format: :json)
	end
end

