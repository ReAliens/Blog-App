require "rails_helper"

RSpec.describe Comment, type: :model do
  it "update comment counter" do
    user = User.create!(name: "Tom", photo: "https://unsplash.com/photos/F_-0BxGuVvo", bio: "Teacher from Mexico.", posts_counter: 0)
    post = Post.create(author: user, title: "Hello", comments_counter: 3, likes_counter: 5)
    comment = Comment.create(author: user, post: post, text: "Hi Tom!")
    comment.update_comments_counter
    comment.update_comments_counter
    comment.update_comments_counter
    expect(post.comments_counter).to be 6
  end
end
