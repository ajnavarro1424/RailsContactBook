class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :given_name
      t.string :family_name
      t.string :email_address
      t.string :home_address

      t.timestamps
    end
  end
end
