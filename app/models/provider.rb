class Provider < ApplicationRecord
  belongs_to :user
  has_many :tickets

  validates :rut, presence: true
  validates :name, presence: true

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Provider.create! row.to_hash
    end
  end
end
