class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :send_to
      t.string :cc
      t.string :bcc
      t.string :title
      t.text :subject

      t.timestamps
    end
  end
end
