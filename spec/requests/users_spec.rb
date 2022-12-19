require 'rails_helper'

describe 'Users', type: :request do
  #    get(:index)
  it 'should render index template' do
    get users_path
    expect(response).to render_template(:index)
  end

  it 'response status should be correct' do
       user2 = User.create(name: 'Meshu', photo: 'http://example.com', bio: 'Hi there', posts_counter: 0)
    get users_path(user2)
    expect(response).to have_http_status(:ok)
  end

  it 'response body should include List of all users' do
    user2 = User.create(name: 'Meshu', photo: 'http://example.com', bio: 'Hi there', posts_counter: 0)
    get users_path(user2)
    expect(response.body).to include 'Welcome to siy blog'
  end

  it 'should render show template ' do
       get users_path, params: {id: 26}

    expect(response).to render_template(:index)
  end

  it 'response status should be correct for show action' do
    get users_path, params: {id: 26}
    expect(response).to have_http_status(:ok)
  end

  it 'should contains Bio ' do
    get users_path, params: {id: 26}
    expect(response.body).to include 'Copyright'
  end
end
