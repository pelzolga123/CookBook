class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]
  before_action :current_user, only: %i[create destroy]
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @posts = current_user.posts
  end

  def show; end
  
  def new
    @post = Post.new
    @posts = current_user.posts
  end
  
  def create
    @post = current_user.posts.build(post_params)
    @post.user = current_user
    respond_to do |format|
      if @post.save
        format.html { redirect_to authenticated_root_path, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { redirect_to new_post_path, alert: 'post not created' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:content, :image)
  end
end
