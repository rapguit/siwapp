	json.data do
	json.type "item"
	json.extract! @item, :id
	json.attributes do
		json.extract! @item, :description, :unitary_cost, :quantity, :discount
	end
	json.relationships do
		json.taxes @item.taxes do |tax|
			json.extract! tax, :id
			json.type "tax"
			json.attributes do
		  	json.extract! tax, :id, :name
		  end
		  json.links do
		  	json.related api_v1_tax_url tax
		  end
		end
	end
	json.links do
		json.self api_v1_item_url @item
	end
end