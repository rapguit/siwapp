json.data do
	json.array! @items do |item|
		json.type "item"
		json.extract! item, :id
		json.attributes do
		  json.extract! item, :description, :unitary_cost, :quantity, :discount
		end
		json.relationships do
			json.taxes api_v1_item_taxes_url item
		end
		json.links do
			json.self api_v1_item_url item
		end
	end
end
