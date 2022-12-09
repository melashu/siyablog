require 'rails_helper'
# require_relative '../app/models/user.rb'
RSpec.describe User do
  user = User.new(photo: 'http://example.com', bio: 'Hi there', posts_counter: 0)
  before { user.save }
  it 'title should be present' do
    expect(user).to_not be_valid
  end

  it 'posts_counter should be integer number' do
    user2 = User.new(name: 'Meshu', photo: 'http://example.com', bio: 'Hi there', posts_counter: 0)
    user2.save
    expect(user2).to be_valid
  end

  it 'recent_post should return 1' do
    user2 = User.create(name: 'Meshu', photo: 'http://example.com', bio: 'Hi there', posts_counter: 0)
    Post.create(author: user2, title: 'Rails intro', text: 'Hello rails intro', comment_counter: 2,
                like_counter: 0)
    expect(user2.recent_post).to be 1
  end
end
