class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.text :title
      t.text :description
      t.text :cover_image
      t.datetime :reg_st
      t.datetime :reg_et
      t.integer :fees
      t.text :venue
      t.text :event_type
      t.text :tag

      t.timestamps
    end
  end
end
