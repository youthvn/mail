class AddGroupIdContact < ActiveRecord::Migration
  def up
  	add_column :contacts, :group_id, :integer
  end

  def down
  end
end
