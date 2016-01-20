class CreateReminders < ActiveRecord::Migration
  def change
    create_table :reminders do |t|
      t.string :name
      t.date :due_date
      t.string :tool

      t.timestamps null: false
    end
  end
end
