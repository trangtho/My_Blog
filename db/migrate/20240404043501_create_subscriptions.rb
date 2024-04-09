class CreateSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :subscriptions do |t|
      t.references :subcriber, foreign_key: { to_table: :users }
      t.references :subcriber_to, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
