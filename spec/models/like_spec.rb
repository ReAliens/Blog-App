require "rails_helper"

RSpec.describe Like, type: :model do
  it "update likes counter" do
    user = User.create!(name: "Tom", photo: "https://unsplash.com/photos/F_-0BxGuVvo", bio: "Teacher from Mexico.", posts_counter: 0)
    post = Post.create(author: user, title: "Hello", comments_counter: 3, likes_counter: 5)
    like = Like.create(author: user, post: post)
    like.update_likes_counter
    like.update_likes_counter
    like.update_likes_counter
    expect(post.likes_counter).to be 8
  end
end
