class AddJazzCafeIdToDiaries < ActiveRecord::Migration[7.1]
  def change
    add_reference :diaries, :jazz_cafe, foreign_key: true
  end
end
