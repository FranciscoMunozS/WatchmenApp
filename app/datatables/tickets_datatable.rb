class TicketsDatatable < ApplicationDatatable
  delegate :edit_ticket_path, to: :@view

  private

  def data
    tickets.map do |ticket|
      [].tap do |column|
        column << ticket.correlative
        column << ticket.memo
        column << ticket.ticket_number
        column << ticket.project_name
        column << ticket.bip
        column << ticket.analist

        links = []
        links << link_to('Ver', ticket, class: 'btn btn-primary btn-sm')
        links << link_to('Editar', edit_ticket_path(ticket), class: 'btn btn-success btn-sm')
        links << link_to('Eliminar', ticket, method: :delete, data: { confirm: 'Esta seguro?' }, class: 'btn btn-danger btn-sm')
        column << links.join(' ')
      end
    end
  end

  def count
    Ticket.count
  end

  def total_entries
    tickets.total_count
  end

  def tickets
    @tickets ||= fetch_tickets
  end

  def fetch_tickets
    search_string = []
    columns.each do |term|
      search_string << "#{term} like :search"
    end

    tickets = Ticket.order("#{sort_column} #{sort_direction}")
    tickets = tickets.page(page).per(per_page)
    tickets = tickets.where(search_string.join(' or '), search: "%#{params[:search][:value]}%")
  end

  def columns
    %w(correlative memo ticket_number project_name bip analist)
  end

end
