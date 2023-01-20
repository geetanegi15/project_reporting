class CreateClientInformations < ActiveRecord::Migration[7.0]
  def change
    create_table :client_informations do |t|
      t.string :full_name
      t.string :company
      t.string :url
      t.string :email
      t.string :phone_number

      t.timestamps
    end
  end
end
