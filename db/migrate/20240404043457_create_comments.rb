class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :post, foreign_key: true
      #t.references :users, foreign_key: { to_table: :users }
      #t.references :posts, foreign_key: { to_table: :posts }
      t.text :content

      t.timestamps
    end
  end
end
