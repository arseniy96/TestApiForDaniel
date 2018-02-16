class Api::PostsController < ApiController

  before_action :set_post, only: [:show, :update, :destroy]

  def index
    @posts = Post.all

    render json: @posts
  end

  def show
    render json: @post
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      render json: @post
    else
      render json: {status: fail}
    end
  end

  def update

  end

  def destroy
    @post.delete
    render body: nil, status: :no_content
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :categories)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end