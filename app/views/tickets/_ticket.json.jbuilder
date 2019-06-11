json.extract! ticket, :id, :correlative, :memo, :memo_income_date, :ticket_number, :amount, :currency, :due_date, :caution, :project_name, :bip, :departed_office, :departed_date, :analist, :devolution, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
