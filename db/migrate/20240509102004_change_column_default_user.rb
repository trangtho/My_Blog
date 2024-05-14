class ChangeColumnDefaultUser < ActiveRecord::Migration[7.0]
  def change
    def change
      change_column_default(:users, :email, from: '', to: false)
    end
  end
end
