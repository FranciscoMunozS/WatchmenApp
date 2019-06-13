class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :provider
  belongs_to :bank
  belongs_to :state
  belongs_to :document

  validates :correlative, presence: true

  def due_date
    super.strftime "%d/%m/%Y "
  end

  def departed_date
    super.strftime "%d/%m/%Y "
  end

  def memo_income_date
    super.strftime "%d/%m/%Y "
  end
end
