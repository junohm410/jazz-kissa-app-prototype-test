class AddUniqueIndexToRecords < ActiveRecord::Migration[7.1]
  def change
    add_index :records, %i[title artist_id], unique: true
  end
end
