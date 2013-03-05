class ChangeVacationStructure < ActiveRecord::Migration
  def up
    remove_column :vacations, :leave_text
    remove_column :vacations, :request_hours
  end

  def down
    add_column :vacations, :leave_text, :text, :null => false
    add_column :vacations, :request_hours, :integer, :limit => 2, :null => false
  end
end
