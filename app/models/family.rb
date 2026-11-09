class Family < ApplicationRecord
  has_many :plants, inverse_of: :family

  validates :name, presence: true, uniqueness: true
end
