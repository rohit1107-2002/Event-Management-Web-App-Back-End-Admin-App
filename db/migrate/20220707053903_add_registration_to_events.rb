class AddRegistrationToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :registration, :string, array:true, default: []
  end
end
