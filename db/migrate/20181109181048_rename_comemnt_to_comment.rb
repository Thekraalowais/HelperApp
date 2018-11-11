class RenameComemntToComment < ActiveRecord::Migration[5.2]
  def change
    rename_column :comments, :comemnt, :comment
  end
end
