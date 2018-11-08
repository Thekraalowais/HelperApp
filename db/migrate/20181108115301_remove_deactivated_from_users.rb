class RemoveDeactivatedFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :deactivated, :boolean
  end
end
