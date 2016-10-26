json.data do
	json.extract! @tax, :id
	json.type "tax"
	json.attributes do
		json.extract! @tax, :name, :value, :active, :default
	end
	json.links do
		json.self api_v1_tax_url @tax
	end
end

