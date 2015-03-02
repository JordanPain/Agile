class AddedAnswersPublishedToContactPages < ActiveRecord::Migration
  def change
    add_column :contact_pages, :answer, :string
    add_column :contact_pages, :published, :boolean
  end
end
