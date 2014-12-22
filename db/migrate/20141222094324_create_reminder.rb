class CreateReminder < ActiveRecord::Migration
  def change
    create_table :reminders do |t|
      t.column :description, :text
      t.column :user_id, :integer

      t.timestamps
    end

    add_index :reminders, :user_id
  end
end
