class Spree::Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  belongs_to :category

   has_attached_file :post_image,

      s3_credentials: {
        access_key_id:     ENV['AWS_ACCESS_KEY_ID'],
        secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
        bucket:            ENV['S3_BUCKET_NAME']
      },

      storage:        :s3,
      s3_headers:     { "Cache-Control" => "max-age=31557600" },
      s3_protocol:    "https",
      bucket:         ENV['S3_BUCKET_NAME'],

      styles: {
              mini: '75x75>', # thumbs under image
              small: '250x250>', # images on category view
              product: '400x400>', # full product image
              large: '1000x1000>' # light box image
      },

      path:           "/:class/:id/:style/:basename.:extension",
      default_url:    "/:class/:id/:style/:basename.:extension",
      default_style:  "product"

    validates_attachment_content_type :post_image, content_type: /\Aimage\/.*\Z/
    
end