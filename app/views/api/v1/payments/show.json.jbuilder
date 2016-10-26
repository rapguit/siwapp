json.data do
	json.extract! @payment, :id
	json.type "payment"
	json.attributes do
		json.extract! @payment, :amount, :date, :notes
	end
	json.links do
		json.self api_v1_payment_url @payment
	end
	json.relationships do
		json.invoice do
			json.data do
				json.id @payment.invoice.id
				json.type "invoice"
				json.attributes do
					json.series_number @payment.invoice.to_s
				end
				json.links do
					json.related api_v1_invoice_url @payment.invoice
				end
			end
		end
	end
end

