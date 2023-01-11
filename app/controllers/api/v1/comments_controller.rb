class Api::V1::CommentsController < ApplicationController
  def index
    comment = Comment.all.where(author_id: params[:user_id], post_id: params[:post_id]).includes(:author)
    render json: comment
  end

  def create
    posts = Post.find(params[:post_id])
    current_user = User.find(params[:user_id])
    comment = Comment.new(comment_params)
    comment.author_id = current_user.id
    comment.post_id = posts.id

    if comment.save
      render json: comment, status: :created
    else
      render json: comment.errors, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
