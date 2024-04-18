class CreateJazzCafes < ActiveRecord::Migration[7.1]
  def change
    create_table :jazz_cafes do |t|
      t.string :name

      t.timestamps
    end
  end
end
