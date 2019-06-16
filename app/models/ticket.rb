class Ticket < ApplicationRecord
  before_save :first_notification
  before_save :second_notification

  belongs_to :user
  belongs_to :provider
  belongs_to :bank

  validates :correlative, presence: true

  def first_notification
    self.first_notification = due_date - 30.days
  end

  def second_notification
    self.second_notification = due_date - 15.days
  end
end
