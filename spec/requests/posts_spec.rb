require 'rails_helper'
describe 'Posts', type: :request do

  it 'Should return render index template' do
       user = User.create(name: 'Momo', photo: 'http://example.com', bio: 'Hi there', posts_counter: 0)
    get user_posts_path(user)
    expect(response).to render_template(:index)
  end

  it 'Should return correct status code' do
       user = User.create(name: 'Momo', photo: 'http://example.com', bio: 'Hi there', posts_counter: 0)
  
     get user_posts_path(user)
    expect(response).to have_http_status(:ok)
  end

  it 'Should user name Momo' do
    user = User.create(name: 'Momo', photo: 'http://example.com', bio: 'Hi there', posts_counter: 0)
    post = Post.create(author: user, title: 'Test with rails app', text: 'Hello rails intro', comment_counter: 2,
                  like_counter: 0)
     get user_post_path(user, post)
    expect(response.body).to include 'Momo'
  end
  it 'Should render show template' do
  
  user2 = User.create(name: 'Momo', photo: 'http://example.com', bio: 'Hi there', posts_counter: 0)
    post = Post.create(author: user2, title: 'Test with rails app', text: 'Hello rails intro', comment_counter: 2,
                  like_counter: 0)
     get user_post_path(user2, post)
    expect(response).to render_template(:show)
  end

  it 'Should have Add Comment button' do
     user2 = User.create(name: 'Momo', photo: 'http://example.com', bio: 'Hi there', posts_counter: 0)
   post = Post.create(author: user2, title: 'Test with rails app', text: 'Hello rails intro', comment_counter: 2,
                like_counter: 0)

     get user_post_path(user2, post)
    expect(response.body).to include('Add Comment')
  end
end
