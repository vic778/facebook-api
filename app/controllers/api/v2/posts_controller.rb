class Api::V2::PostsController < ApplicationController
  before_action :authorized
  before_action :set_post, only: %i[update destroy]

  def index
    @posts = Post.all
    render json: @posts
  end

  def show
    @post = Post.find(params[:id])
    render json: @post
  end

  def create
    @post = Post.create(post_params.merge(user: @user))
    if @post.save
      render json: { success: true, message: "Post created successfully" }, status: :created
    else
      render json: { success: false, message: @post.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      render json: { success: true, message: "Post updated successfully" }, status: :ok
    else
      render json: { success: false, message: @post.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    render json: { success: true, message: "Post deleted successfully" }, status: :ok
  end

  private

  def set_post
    @post = @user.posts.find(params[:id])
  end

  def post_params
    params.permit(:description, :image)
  end
end
