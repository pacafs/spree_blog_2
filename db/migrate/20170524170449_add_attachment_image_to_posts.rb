class AddAttachmentImageToPosts < ActiveRecord::Migration
  
  def up
      add_attachment :spree_posts, :image
  end

  def down
      remove_attachment :spree_posts, :image
  end

end