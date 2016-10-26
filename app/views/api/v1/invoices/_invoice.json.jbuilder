  json.extract! invoice, :id
  json.type "invoice"
  json.links do
    json.self api_v1_invoice_url invoice
  end
  json.attributes do
    json.extract! invoice, :series_id, :draft, :sent_by_email, :name, :identification, 
      :email, :invoicing_address, :shipping_address, :contact_person, :terms, :notes,
      :base_amount, :discount_amount, :net_amount, :gross_amount, :paid_amount, :tax_amount,
      :issue_date, :due_date, :days_to_due,
      :created_at, :updated_at
    json.series_number invoice.to_s
    json.status invoice.get_status
    if invoice.get_print_template
      json.download_link api_v1_rendered_template_url id: invoice.get_print_template.id, invoice_id: invoice.id, format: :pdf
    end
  end
  json.relationships do
    if expand
      json.customer do
        json.data do
          json.extract! invoice.customer, :id
          json.type "customer"
          json.attributes do
            json.extract! invoice.customer, :identification
          end
        end
        json.links do
          json.self api_v1_customer_url invoice.customer
        end
      end
      json.items invoice.items do |item|
        json.data do
          json.type "item"
          json.extract! item, :id
          json.attributes do
            json.extract! item, :description, :unitary_cost, :quantity, :discount
          end
          json.links do
            json.related api_v1_item_url item
          end
          json.taxes item.taxes do |tax|
            json.data do
              json.extract! tax, :id
              json.attributes do
                json.extract! tax,  :name, :value
              end
              json.links do
                json.related api_v1_tax_url tax
              end
            end
          end
        end
      end

      json.payments invoice.payments do |payment|
        json.extract! payment, :id, :notes, :amount, :date
        json.url api_v1_payment_url payment
      end

      unless invoice.get_print_template
        json.rendered_templates @templates, partial: 'rendered_template', as: :template, locals: {invoice: invoice}
      end

    else
      if invoice.customer
        json.customer do
          api_v1_customer_url invoice.customer
        end
      end
      json.items api_v1_invoice_items_url invoice
      json.payments api_v1_invoice_payments_url invoice

    end
  end




