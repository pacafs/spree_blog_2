module Spree
  module Admin
    class PostsController < ResourceController
      
      layout 'spree/layouts/admin'
      
      before_action :set_spree_admin_post, only: [:show, :edit, :update, :destroy]

      def index
        @spree_admin_posts = Spree::Post.all
        # params[:q] ||= {}
        
        # if params[:q][:created_at_gt].present?
        #   params[:q][:created_at_gt] = Time.zone.parse(params[:q][:created_at_gt]).beginning_of_day rescue ""
        # end

        # if params[:q][:created_at_lt].present?
        #   params[:q][:created_at_lt] = Time.zone.parse(params[:q][:created_at_lt]).end_of_day rescue ""
        # end

        # @search = Spree::Post.ransack(params[:q])
        # @spree_admin_posts = @search.result(distinct: true).page(params[:page]).per(params[:per_page])
      end

      def edit
        @categories = Category.all.map{|c| [ c.name, c.id ] }
        @tags = @spree_admin_post.tags
      end

      def update
        @spree_admin_post.category_id = params[:category_id]
        
        if @spree_admin_post.update(spree_admin_post_params)
          redirect_to admin_post_path, notice: 'Post was successfully updated.'
        else
          render :edit
        end
      end

      # POST /spree/posts
      def create
        @spree_admin_post = Spree::Post.create(spree_admin_post_params)
        @spree_admin_post.category_id = params[:category_id]


        if @spree_admin_post.save
          redirect_to admin_posts_path, notice: 'Post was successfully created.'
        else
          render :new
        end
      end


      def show
      end

      # GET /spree/posts/new
      def new
        @spree_admin_post = Spree::Post.new
        @image = Spree::Image.new 
      end

      # DELETE /spree/posts/1
      def destroy
        @spree_admin_post.destroy
        redirect_to admin_posts_url, notice: 'Post was successfully destroyed.'
      end



      private
      
      # Only allow a trusted parameter "white list" through.
      def spree_admin_post_params
        params.require(:post).permit(:title, :content, :post_image, :slug, :category_id, :meta_title, :meta_description, :meta_keywords, :tags)
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_spree_admin_post
        @spree_admin_post = Spree::Post.find(params[:id])
      end

    end
  end
end