class Ticket < ApplicationRecord
  extend Enumerize

  before_save :first_notification
  before_save :second_notification

  belongs_to :user
  belongs_to :provider
  belongs_to :bank

  validates :due_date, presence: true, allow_nil: true
  validates :ticket_number, presence: true, allow_nil: true
  validates :ticket_type, presence: true

  auto_increment :correlative

  enumerize :state, in: { :vigente => 1, :vencido => 2, :despachado => 3}, default: 1

  enumerize :ticket_type, in: [:GARANTIA, :VALE_VISTA, :LETRA_CAMBIO, :CERTIFICADO_PRORROGA, :CERTIFICADO_FIANZA, :POLIZA_GARANTIA, :PAGARE, :CERTIFICADO], default: :GARANTIA

  enumerize :currency, in: [:UF, :CLP, :EUR, :US, :-], default: :CLP

  enumerize :devolution, in: [:DESPACHO, :DESPACHO_CORRESPONDENCIA, :RETIRO_PERSONAL, :-], default: :DESPACHO

  def first_notification
    if self.due_date.nil?
      self.first_notification = '2012-01-01'
    else
      self.first_notification = due_date - 30.days
    end
  end

  def second_notification
    if self.due_date.nil?
      self.second_notification = '2012-01-01'
    else
      self.second_notification = due_date - 15.days
    end
  end
end
