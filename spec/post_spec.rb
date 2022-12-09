require 'rails_helper'
RSpec.describe Post do
  it 'Title should have some value' do
    user2 = User.new(name: 'Meshu', photo: 'http://example.com', bio: 'Hi there', posts_counter: 0)
    post1 = Post.create(author: user2, title: 'Rails intro', text: 'Hello rails intro', comment_counter: 0,
                        like_counter: 0)
    expect(post1).to be_valid
  end

  it 'comment_counter should be greater than or equal to 0' do
    user2 = User.new(name: 'Meshu', photo: 'http://example.com', bio: 'Hi there', posts_counter: 0)
    post1 = Post.create(author: user2, title: 'Rails intro', text: 'Hello rails intro', comment_counter: 2,
                        like_counter: 0)
    expect(post1).to be_valid
  end

  it 'like_counter should be integer and greater than or equal to 0' do
    user2 = User.new(name: 'Meshu', photo: 'http://example.com', bio: 'Hi there', posts_counter: 0)
    post1 = Post.create(author: user2, title: 'Rails intro', text: 'Hello rails intro', comment_counter: 2)
    expect(post1).not_to be_valid
  end
end
