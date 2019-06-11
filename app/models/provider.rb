class Provider < ApplicationRecord
  belongs_to :user
  has_many :tickets

  validates :rut, presence: true
  validates :name, presence: true
end
