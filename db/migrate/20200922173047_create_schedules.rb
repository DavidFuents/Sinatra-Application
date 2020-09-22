class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.string :title
      t.string :heading
      t.string :row
      t.string :user_id

      t.timestamps null: false
    end
  end
end
