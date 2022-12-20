require 'rails_helper'


describe User, type: :feature do 
    before :each do
      @user1 =  User.create(name: 'Ema', photo: 'https://images.unsplash.com/photo-1661956602116-aa6865609028?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',bio:'Here my story', posts_counter: 3)
    end
        it 'Should have user name Ema' do

      visit user_path(@user1)
        
        expect(page).to have_content('Ema')
        end

    it 'I can see the number of posts Ema has written.' do
      visit user_path(@user1)

         Post.create(author: @user1, title: 'Introduction to rails', text: 'Rails is a web',comment_counter:0,like_counter:0)
         Post.create(author: @user1, title: 'Introduction to testing', text: 'Rails is a web',comment_counter:0,like_counter:0)
         Post.create(author: @user1, title: 'Introduction to Capybara', text: 'Rails is a web',comment_counter:0,like_counter:0)
        expect(page).to have_content ('Number of posts: 3')
    end

    it 'I can see the Ema bio.' do
      visit user_path(@user1)

        expect(page).to have_content (@user1.bio)
    end

    it 'I can see the users first 3 posts.' do
         Post.create(author: @user1, title: 'Introduction to rails', text: 'Rails is a web',comment_counter:0,like_counter:0)
         Post.create(author: @user1, title: 'Introduction to testing', text: 'Rails is a web',comment_counter:0,like_counter:0)
         Post.create(author: @user1, title: 'Introduction to Capybara', text: 'Rails is a web',comment_counter:0,like_counter:0)
         Post.create(author: @user1, title: 'Introduction to migration', text: 'Rails is a web',comment_counter:0,like_counter:0)
        visit user_path(@user1)
     
        expect(page).to have_content ('Introduction to testing')
        expect(page).to have_content ('Introduction to testing')
        expect(page).to have_content ('Introduction to migration')
    end

     it 'I can see a button that lets me view all of a users posts.' do
      visit user_path(@user1)

        expect(page).to have_link ('See all post')
    end
     it 'When I click to see all posts, it redirects me to the users posts index page..' do
      visit user_path(@user1)
    #   /users/:id
      
        click_link('See all post')
        expect(current_path).to eq (user_posts_path(@user1))
    end
       it 'I can see the users profile picture' do
        visit user_path(@user1)
       expect(page).to have_css("img", :count => 1)
    end

     it 'When I click a users post, it redirects me to that posts show page.' do
        post =  Post.create(author: @user1, title: 'Introduction to rails', text: 'Rails is a web',comment_counter:0,like_counter:0)
        visit user_posts_path(@user1, post)
        expect(current_path).to eq (user_posts_path(@user1, post))
    end



end
