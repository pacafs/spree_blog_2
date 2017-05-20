module Spree
  class PostsController < Spree::StoreController
    
  before_action :set_spree_post, only: [:show, :edit]

  # GET /spree/posts
  def index
    @spree_posts = Spree::Post.all
  end

  # GET /spree/posts/1
  def show
  end

  # GET /spree/posts/new
  def new
    @spree_post = Spree::Post.new
  end

  # GET /spree/posts/1/edit
  def edit
  end

  # POST /spree/posts
  def create
    @spree_post = Spree::Post.new(spree_post_params)

    if @spree_post.save
      redirect_to @spree_post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /spree/posts/1
  def update
    if @spree_post.update(spree_post_params)
      redirect_to @spree_post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /spree/posts/1
  def destroy
    @spree_post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spree_post
      @spree_post = Spree::Post.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def spree_post_params
      params.require(:post).permit(:title, :content)
    end
  
  end
end