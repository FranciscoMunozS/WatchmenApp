class Provider < ApplicationRecord
  belongs_to :user

  validates :rut, presence: true
  validates :socialreason, presence: true
end
