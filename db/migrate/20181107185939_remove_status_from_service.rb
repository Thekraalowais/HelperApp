class RemoveStatusFromService < ActiveRecord::Migration[5.2]
  def change
    remove_column :services, :status, :boolean
  end
end
