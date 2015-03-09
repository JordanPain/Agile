 class CreateContactPages < ActiveRecord::Migration
  def change
    create_table :contact_pages do |t|
      t.integer :user_id
      t.string :phone
      t.string :contact_me
      t.string :reason_selected
      t.text :question

      t.timestamps
    end
  end
end
