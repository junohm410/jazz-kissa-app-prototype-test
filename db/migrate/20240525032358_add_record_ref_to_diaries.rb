class AddRecordRefToDiaries < ActiveRecord::Migration[7.1]
  def change
    add_reference :diaries, :record, foreign_key: true
  end
end
