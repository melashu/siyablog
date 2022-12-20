require 'rails_helper'

describe User, type: :feature do 
    before :each do
      @user1 =  User.create(name: 'John', photo: 'https://images.unsplash.com/photo-1661956602116-aa6865609028?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',bio:'Here my story', posts_counter: 3)
    #   @post1 = Post.create(author: @user1, title: 'Introduction to rails', text: 'Rails is a web',comment_counter:0,like_counter:0)
    #   @post2 = Post.create(author: @user1, title: 'Introduction to testing', text: 'Rails is a web',comment_counter:0,like_counter:0)
    #   @post3 = Post.create(author: @user1, title: 'Introduction to Capybara', text: 'Rails is a web',comment_counter:0,like_counter:0)
    # Capybara.default_max_wait_time = 10
    end
        it 'Should have user name John' do
        visit user_path(@user1)
        
        expect(page).to have_content('John')
        end

    it 'I can see the number of posts John has written.' do
        visit user_path(@user1)
        expect(page).to have_content ('Number of posts: 3')
    end

    it 'I can see the John bio.' do
        visit user_path(@user1)
        expect(page).to have_content (@user1.bio)
    end


end