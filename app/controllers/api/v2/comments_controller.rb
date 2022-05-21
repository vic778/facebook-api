class Api::V2::CommentsController < ApplicationController
  before_action :authorized

  # def index
  #    @post = Post.find(params[:post_id])
  #    @comments = @post.comments.all
  # end

  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params.merge(user: @user))
    if @comment.save
      render json: @comment, status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.permit(:text)
  end
end
