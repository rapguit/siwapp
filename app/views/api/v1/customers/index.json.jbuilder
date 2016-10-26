json.data do
	json.array! @customers, partial: 'customer', as: :customer
end
