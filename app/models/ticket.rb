class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :provider
  belongs_to :bank
  belongs_to :state
  belongs_to :document

  validates :correlative, presence: true
end
