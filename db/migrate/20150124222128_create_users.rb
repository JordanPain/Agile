class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :userName
      t.string :firstName
      t.string :lastName
      t.date :birthdate
      t.string :city
      t.string :state
      t.integer :zip
      t.text :about
      t.string :gender
      t.boolean :admin

      t.timestamps
    end
  end
end
