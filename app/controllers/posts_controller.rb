class PostsController < ApplicationController
  before_action :logged_in_user

  def index
    @posts = Post.all
  end

  def new
    # necessary for validation error message
    @post = Post.new
  end

  def create
    @post = Post.new
    @post.message = params[:message]
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def delete_all_post
    Post.delete_all
    redirect_to posts_path
  end
end
