class CreatorIdForeignKeyToEvents < ActiveRecord::Migration[5.1]
  def change
  	add_foreign_key :events, :users, column: :creator_id
  end
end
