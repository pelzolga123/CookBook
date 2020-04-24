class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]
  before_action :current_user, only: %i[create destroy]
  before_action :set_post, only: %i[show edit update destroy]
  before_action :authorized_to_edit_destroy?, only: %i[edit destroy]

  def index
    @posts = Post.all
  end

  def show; end
  
  def new
    @post = Post.new
    @posts = current_user.posts
    @post.recipes.build 
  end
  
  def create
    @post = current_user.posts.build(post_params)
    @post.user = current_user
    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_url, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { redirect_to new_post_path, alert: 'post not created' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:content, :image, recipes_attributes: [:id, :ingredient_name, :measurement])
  end

  def authorized_to_edit_destroy?
    redirect_to :authenticated_root unless @post.user_id == current_user.id
  end
end
