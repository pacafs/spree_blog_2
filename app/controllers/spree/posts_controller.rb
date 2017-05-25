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


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spree_post
      @spree_post = Spree::Post.find(params[:id])
    end

  end
end

