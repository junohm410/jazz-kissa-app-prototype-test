class Record < ApplicationRecord
  has_many :diaries, dependent: :nullify
  belongs_to :artist

  validates :title, presence: true
  validates :title, uniqueness: { scope: :artist_id }
end
