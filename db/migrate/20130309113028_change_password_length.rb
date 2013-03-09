class ChangePasswordLength < ActiveRecord::Migration
  def up
    change_column :users, :password, :string, :limit => 80, :null => false
  end

  def down
    change_column :users, :password, :string, :limit => 20, :null => false
  end
end
