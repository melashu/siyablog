require 'rails_helper'

describe 'Users', type: :request do
  #    get(:index)
  it 'should render index template' do
    get users_path
    expect(response).to render_template(:index)
  end

  it 'response status should be correct' do
    get users_path
    expect(response).to have_http_status(:ok)
  end

  it 'should have no user record' do
    get users_path
    expect(assigns(:user).size).to be 0
  end

  it 'response body should include List of all users' do
    get users_path
    expect(response.body).to include 'List of all users'
  end

  it 'should render show template ' do
    get user_path(5)
    expect(response).to render_template(:show)
  end

  it 'response status should be correct for show action' do
    get user_path(5)
    expect(response).to have_http_status(:ok)
  end

  it 'should contains User5 ' do
    get user_path(5)
    expect(response.body).to include 'User5'
  end
end
