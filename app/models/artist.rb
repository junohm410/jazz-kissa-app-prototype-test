class Artist < ApplicationRecord
  has_many :records, dependent: :nullify

  validates :name, presence: true, uniqueness: true
end
