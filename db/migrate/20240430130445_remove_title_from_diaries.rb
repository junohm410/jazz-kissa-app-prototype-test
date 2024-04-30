class RemoveTitleFromDiaries < ActiveRecord::Migration[7.1]
  def change
    remove_column :diaries, :title, :string
  end
end
