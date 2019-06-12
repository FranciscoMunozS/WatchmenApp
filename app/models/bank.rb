class Bank < ApplicationRecord
  belongs_to :user
  has_many :tickets

  validates :name, presence: true
end
