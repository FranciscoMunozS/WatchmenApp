class Ticket < ApplicationRecord
  extend Enumerize

  before_save :first_notification
  before_save :second_notification

  after_save :send_first_email
  after_save :send_second_email

  before_save :first_call_email
  before_save :second_call_email

  belongs_to :user
  belongs_to :provider
  belongs_to :bank

  validates :ticket_number, presence: true
  validates :due_date, presence: true
  validates :ticket_type, presence: true

  auto_increment :correlative

  enumerize :state, in: { :vigente => 1, :vencido => 2, :despachado => 3}, default: 1

  enumerize :ticket_type, in: [:GARANTIA, :VALE_VISTA, :LETRA_CAMBIO, :CERTIFICADO_PRORROGA, :CERTIFICADO_FIANZA, :POLIZA_GARANTIA, :PAGARE, :CERTIFICADO], default: :GARANTIA

  enumerize :currency, in: [:UF, :CLP, :EUR, :US, :-], default: :CLP

   enumerize :devolution, in: [:DESPACHO, :DESPACHO_CORRESPONDENCIA, :RETIRO_PERSONAL, :-], default: :DESPACHO

  def first_notification
    self.first_notification = due_date - 30.days
  end

  def second_notification
    self.second_notification = due_date - 15.days
  end

  def first_call_email
    self.first_call = (first_notification.to_date - Date.today).to_i
  end

  def second_call_email
    self.second_call = (second_notification.to_date - Date.today).to_i
  end

  def send_first_email
    SendNotificationJob.set(wait: self.first_call.days).perform_later(self)
  end

  def send_second_email
    SendSecondNotificationJob.set(wait: self.second_call.days).perform_later(self)
  end
end
