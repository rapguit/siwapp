json.array! @payments do |payment|
	json.data do
		json.extract! payment, :id
		json.type "payment"
	  json.attributes do
	  	json.extract! payment, :amount, :date, :notes
	  end
		json.links do
	  	json.self api_v1_payment_url payment
	  end
  end
end