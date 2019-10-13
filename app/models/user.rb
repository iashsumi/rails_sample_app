class User < ApplicationRecord
  extend Import

  enum sex: { male: 0, female: 1 }
  validates :name, presence: true
  validates :birthday, presence: true
  validates :sex, presence: true
  validates :address, presence: true
  validates :email, presence: true

  def self.updatable_attributes
    %w(name birthday address sex email)
  end
end
