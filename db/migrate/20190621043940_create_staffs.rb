class CreateStaffs < ActiveRecord::Migration[5.2]
  def change
    create_table :staffs do |t|
      t.integer :staff_id
      t.integer :user_id

      t.timestamps
    end
  end
end
