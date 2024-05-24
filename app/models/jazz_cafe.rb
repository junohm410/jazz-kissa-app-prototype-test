class JazzCafe < ApplicationRecord
  has_many :diaries, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
