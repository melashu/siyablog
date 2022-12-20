require 'rails_helper'

describe User, type: :feature do
  before :each do
    @user1 = User.create(name: 'John',
                         photo: 'https://images.unsplash.com/photo-1661956602116-aa6865609028?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60', bio: 'Here my story', posts_counter: 3)
    @user2 = User.create(name: 'meshu',
                         photo: 'https://images.unsplash.com/photo-1661956602116-aa6865609028?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60', bio: 'Here my story', posts_counter: 0)
  end

  it 'Should have user name John' do
    visit users_path
    expect(page).to have_content('John')
    expect(page).to have_content('meshu')
  end

    it 'When I click on a user, I am redirected to that users show page.' do
         visit users_path 
         all('.user-link').each do |user|
            user.click
            expect(page).to have_content('John')
            expect(current_path).to eq user_path(@user1)
            expect(page).to have_content(@user1.bio)
         end

    end
  end

    it 'I can see the number of posts each user has written.' do
        visit users_path
        expect(page).to have_content ('Number of posts: 3')
    end
    # it 'can see the profile picture for each user.' do
    #     visit users_path 
    #     all_img = all('.user-card .user-img')
    #     all_img.each do |img|
    #      visit img[:src]
    #         expect(current_path).to eq @user1.photo
    #     end
    # end
end
