json.extract! customer, :id
	json.attributes do
		json.extract! customer, :name, :identification, :email, :name_slug, :identification, :contact_person, :invoicing_address
	end
	json.links do
		json.self api_v1_customer_url customer, format: :json
	end