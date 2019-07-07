class ProvidersDatatable < ApplicationDatatable
  delegate :edit_provider_path, to: :@view

  private

  def data
    providers.map do |provider|
      [].tap do |column|
        column << provider.rut
        column << provider.name

        links = []
        links << link_to('Ver', provider, class: 'btn btn-primary btn-sm')
        links << link_to('Editar', edit_provider_path(provider), class: 'btn btn-success btn-sm')
        links << link_to('Eliminar', provider, method: :delete, data: { confirm: 'Are you sure?' }, class: 'btn btn-danger btn-sm')
        column << links.join(' ')
      end
    end
  end


  def count
    Provider.count
  end

  def total_entries
    providers.total_count
  end

  def providers
    @providers ||= fetch_providers
  end

  def fetch_providers
    search_string = []
    columns.each do |term|
      search_string << "#{term} like :search"
    end

    providers = Provider.order("#{sort_column} #{sort_direction}")
    providers = Provider.page(page).per(per_page)
    providers = providers.where(search_string.join(' or '), search: "%#{params[:search][:value]}%")
  end

  def columns
    %w(rut name)
  end
end
