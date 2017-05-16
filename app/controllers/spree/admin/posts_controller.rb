module Spree
  module Admin
    class PostsController < ResourceController
      
      layout 'spree/layouts/admin'
      
      before_action :set_spree_post, only: [:show, :edit, :update, :destroy]

      def index
      # GET /spree/posts
        @spree_posts = Spree::Post.all
      end

      def edit
      end

      def update
        if @spree_post.update(spree_post_params)
          redirect_to admin_post_path, notice: 'Post was successfully updated.'
        else
          render :edit
        end
      end

      # POST /spree/posts
      def create
        @spree_post = Spree::Post.new(spree_post_params)

        if @spree_post.save
          redirect_to admin_posts_path, notice: 'Post was successfully created.'
        else
          render :new
        end
      end


      def show
      end

      # GET /spree/posts/new
      def new
        @spree_post = Spree::Post.new
      end

      # DELETE /spree/posts/1
      def destroy
        @spree_post.destroy
        redirect_to admin_posts_url, notice: 'Post was successfully destroyed.'
      end

      private
      
      # Only allow a trusted parameter "white list" through.
      def spree_post_params
        params.require(:post).permit(:title, :content)
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_spree_post
        @spree_post = Spree::Post.find(params[:id])
      end
    
    end
  end


end