json.data do
	json.array! @invoices, partial: 'invoice', as: :invoice, locals: {expand: false}
end
