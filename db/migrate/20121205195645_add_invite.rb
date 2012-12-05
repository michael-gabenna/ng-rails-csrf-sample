class AddInvite < ActiveRecord::Migration
  def up
    create_table :invites do |t|
      t.timestamps
      t.string :content
    end
  end

  def down
    drop_table :invites
  end
end
