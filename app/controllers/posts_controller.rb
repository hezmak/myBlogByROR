class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  def new
    @post = Post.new
  end

  def create
    if user_signed_in? and current_user.has_role?(:admin) 
      @post = Post.new(post_params)
      if @post.save
      redirect_to @post
      else
      redirect_to :back
      end
    
    else
      redirect_to :back
    end
  end




  def edit
  end

  def show
  end

  def destroy
    if @post.destroy
      redirect_to :posts
    else
      redirect_to :back
    end
  end

  def index
    @posts = Post.paginate(:page => params[:page], :per_page => 4)
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      redirect_to :back
    end
  end
  
  private
  def post_params
    params.require(:post).permit(:title, :content)
  end
  
  def find_post
      @post = Post.find(params[:id])
  end


end
