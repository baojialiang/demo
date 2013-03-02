class AddLeaveDays < ActiveRecord::Migration
  def up
    add_column("vacations","request_hours", :integer, :limit => 2, :null => false)
    rename_column("vacations","remain_days","remain_hours")
    change_column("vacations","remain_hours",:integer, :limit => 2, :default => 120)
    
  end

  def down
    change_column("vacations","remain_hours",:integer,:limit => 1)
    rename_column("vacations","remain_hours","remain_days")
    remove_column("vacations","request_hours")
  end
end
