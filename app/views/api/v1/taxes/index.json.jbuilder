json.data do
	json.array!(@taxes) do |tax|
		json.extract! tax, :id
		json.type "tax"
		json.attributes do
			json.extract! tax, :name, :value, :default, :active
		end
		json.links do
			json.self api_v1_tax_url tax
		end
	end
end
