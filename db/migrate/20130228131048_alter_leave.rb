class AlterLeave < ActiveRecord::Migration
  def up
    rename_table("leaves","vacations")
    change_table :vacations do |t|
      t.references :user
    end
   add_index("vacations","user_id")
  end

  def down
    remove_index("vacations","user_id")
    change_table :vacations do |t|
      t.remove :user_id
    end
    rename_table("vacations","leaves")
  end
end
