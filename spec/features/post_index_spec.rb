require 'rails_helper'

describe Post, type: :feature do
  before :each do
    
    @user1 =  User.create(name: 'John', photo: 'https://images.unsplash.com/photo-1661956602116-aa6865609028?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',bio:'Here my story', posts_counter: 3)
    @user2 =  User.create(name: 'meshu', photo: 'https://images.unsplash.com/photo-1661956602116-aa6865609028?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',bio:'Here my story', posts_counter: 0)

    @post1 = Post.create(title: 'First Post', text: 'Here is my post', comment_counter: 0, like_counter: 0, author: @user1)

    @comment = Comment.create(text: 'Here is my comment', author: @user2, post: @post1)
    puts @comment, @post1
  end

  # test if the user of the post has an image

  it 'should  have an image' do
    visit("users/#{@user1.id}/posts")
    expect(page).to have_css('img', count: 1)
  end

  it 'should have a username' do
    visit("users/#{@user1.id}/posts")

    expect(page).to have_content @post1.author.name
  end

  # it 'should have the number of posts' do
  #   visit("users/#{@user1.id}/posts")

  #   expect(page).to have_content "Number of post: #{@post1.author.posts_counter.to_s}"
  # end

  it 'should have the post title' do
    visit("users/#{@user1.id}/posts")

    expect(page).to have_content(@post1.title)
  end

  it 'should have the post body' do
    visit("users/#{@user1.id}/posts")

    expect(page).to have_content @post1.text
  end

  it 'should see some posts comments' do
    visit("users/#{@user1.id}/posts")

    expect(page).to have_content @comment.text
  end
  it 'should have comment number' do
    visit("users/#{@user1.id}/posts")

    expect(page).to have_content "Comments: #{@post1.comment_counter.to_s}"
  end

  it 'should have likes number' do
    visit("users/#{@user1.id}/posts")

    expect(page).to have_content "Likes: #{@post1.like_counter.to_s}"
  end

  it 'should have pagination post fit the view' do
    visit("users/#{@user1.id}/posts")

    expect(page).to have_content "Pagination"
  end
  it 'should redirect to a post' do
    visit("users/#{@user1.id}/posts")
    click_link "#{@post1.title}"
    expect(current_path).to eq(user_post_path(@user1, @post1.id))
  end

end
