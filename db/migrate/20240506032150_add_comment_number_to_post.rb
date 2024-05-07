class AddCommentNumberToPost < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :comment_num, :integer, default: 0
  end
end
