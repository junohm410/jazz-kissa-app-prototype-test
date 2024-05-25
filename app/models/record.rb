class Record < ApplicationRecord
  has_many :diaries, dependent: :nullify

  validates :title, presence: true
end
