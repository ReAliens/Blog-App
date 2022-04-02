require 'spec_helper'

RSpec.describe User, type: :model do
  it 'create 2 posts for valid user and checking them' do
    user = User.create!(name: 'John Doe',
                        photo: 'https://png.pngitem.com/pimgs/s/506-5067022_sweet-shap-profile-placeholder-hd-png-download.png',
                        bio: 'test test', posts_counter: 0)

    first_post = Post.create!(author: user, title: 'Hello', text: 'This is my first post')
    second_post = Post.create!(author: user, title: 'Hello', text: 'This is my first post')

    recent_created = user.recent_posts
    expect(recent_created[0].id).to be first_post.id
    expect(recent_created[1].id).to be second_post.id
  end

  it 'should return invalid message for create user where name and posts counter are blank' do
    wrong_user = User.create
    expect(wrong_user).to_not be_valid
  end
  it 'should return invalid message for create user where posts counter is blank' do
    wrong_user = User.create(name: 'Bob')
    expect(wrong_user).to_not be_valid
  end
  it 'should return invalid message for create user where name is blank' do
    wrong_user = User.create(posts_counter: 0)
    expect(wrong_user).to_not be_valid
  end
  it 'should create user' do
    valid_user = User.create(name: 'Bob', posts_counter: 0)
    expect(valid_user).to be_valid
  end
end
