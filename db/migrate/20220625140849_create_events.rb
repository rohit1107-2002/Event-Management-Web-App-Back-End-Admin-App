class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.text :cover_image
      t.datetime :Reg_ST
      t.datetime :Reg_ET
      t.integer :fees
      t.text :venue
      t.string :event_type
      t.string :tag

      t.timestamps
    end
  end
end
