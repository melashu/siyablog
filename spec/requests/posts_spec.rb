require 'rails_helper'
describe 'Posts', type: :request do
  it 'Should return render index template' do
    get user_posts_path(10)
    expect(response).to render_template(:index)
  end

  it 'Should return correct status code' do
    get user_posts_path(10)
    expect(response).to have_http_status(:ok)
  end

  it 'Should user name User10' do
    get user_posts_path(10)
    expect(response.body).to include 'User10'
  end
  it 'Should render show template' do
    get '/users/10/posts/10'
    expect(response).to render_template(:show)
  end

  it 'Should have post number 9' do
    get '/users/10/posts/9'
    expect(response.body).to include('Post 9')
  end
end
