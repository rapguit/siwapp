json.data do
	json.partial! 'invoice', invoice: @invoice, expand: true
end