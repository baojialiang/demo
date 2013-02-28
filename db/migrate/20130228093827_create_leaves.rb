class CreateLeaves < ActiveRecord::Migration
  def change
    create_table :leaves do |t|
      t.text "leave_text", :null => false
      t.integer "remain_days", :limit => 1, :default => 15, :null => false
      t.timestamps
    end
  end
end
