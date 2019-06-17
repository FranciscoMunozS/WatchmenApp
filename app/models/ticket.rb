class Ticket < ApplicationRecord
  extend Enumerize

  before_save :first_notification
  before_save :second_notification

  belongs_to :user
  belongs_to :provider
  belongs_to :bank

  validates :correlative, presence: true

  enumerize :state, in: [:vigente, :vencido, :despachado], default: :vigente

  enumerize :ticket_type, in: [:garantia, :vale_vista], default: :garantia

  def first_notification
    self.first_notification = due_date - 30.days
  end

  def second_notification
    self.second_notification = due_date - 15.days
  end
end
