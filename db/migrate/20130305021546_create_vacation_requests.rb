class CreateVacationRequests < ActiveRecord::Migration
  def change
    create_table :vacation_requests do |t|
      t.text     "leave_text", :null => false
      t.integer  "request_hours", :limit => 2, :null => false
      t.integer  "remain_hours", :limit => 2, :null => false
      t.references :user
      t.timestamps
    end
    add_index("vacation_requests","user_id")
  end
end
