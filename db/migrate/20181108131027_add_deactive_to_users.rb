class AddDeactiveToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :deactive, :boolean, default: false
  end
end
