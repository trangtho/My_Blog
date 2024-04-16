class CreatePostcategories < ActiveRecord::Migration[7.0]
  def change
    create_table :postcategories do |t|
      t.belongs_to :category, foreign_key: true
      t.belongs_to :post, foreign_key: true
      
      t.timestamps
    end
  end
end
