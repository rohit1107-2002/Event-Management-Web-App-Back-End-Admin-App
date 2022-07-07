class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :email
      t.string :password_digest
      t.string :name
      t.string :username

      t.timestamps
    end
  end
end
