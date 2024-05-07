class AddCommentNumberToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :comment_num, :integer, default: 0
  end
end
