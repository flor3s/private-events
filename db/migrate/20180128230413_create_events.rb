class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :location
      t.date :event_date
      t.time :event_time

      t.timestamps
    end
  end
end
