class AddArtistRefToRecord < ActiveRecord::Migration[7.1]
  def change
    add_reference :records, :artist, foreign_key: true
  end
end
