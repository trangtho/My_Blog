class DeleteEmailColumnUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :email
  end
end
