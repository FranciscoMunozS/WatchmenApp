class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  has_many :providers, dependent: :destroy
  has_many :banks,     dependent: :destroy
  has_many :tickets,   dependent: :destroy
  has_many :states,    dependent: :destroy
  has_many :charges,   dependent: :destroy
  has_many :documents, dependent: :destroy

  def admin?
    has_role?(:admin)
  end

  def editor?
    has_role?(:editor)
  end
end
