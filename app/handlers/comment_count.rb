class CommentCount
  def call(event)
    post_id = event.data.fetch(:post_id)
    userpost_id = event.data.fetch(:userpost_id)
    if event.event_type == 'CommentCreated'
        set_comment_num_increase(post_id, userpost_id)
    end
    if event.event_type == 'CommentDestroyed'
        set_comment_num_descrease(post_id, userpost_id)
    end

  end

  private
  def set_comment_num_increase(post_id, userpost_id)
    post = Post.find(post_id)
    num = post['comment_num'] + 1
    post.update(comment_num: num)
    user = User.find(userpost_id)
    num_of_user = user['comment_num'] + 1
    user.update(comment_num: num_of_user)
  end
  def set_comment_num_descrease(post_id, userpost_id)
    post = Post.find(post_id)
    num = post['comment_num'] - 1
    post.update(comment_num: num)
    user = User.find(userpost_id)
    num_of_user = user['comment_num'] - 1
    user.update(comment_num: num_of_user)
  end
end
