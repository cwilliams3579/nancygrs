class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.string :nickname
      t.string :number
      t.text :message

      t.timestamps
    end
  end
end
