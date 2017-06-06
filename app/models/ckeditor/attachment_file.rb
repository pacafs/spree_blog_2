class Ckeditor::AttachmentFile < Ckeditor::Asset
  # has_attached_file :data,
  #                   :url => "/ckeditor_assets/attachments/:id/:filename",
  #                   :path => ":rails_root/public/ckeditor_assets/attachments/:id/:filename"
  has_attached_file :data,

      s3_credentials: {
        access_key_id:     ENV['AWS_ACCESS_KEY_ID'],
        secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
        bucket:            ENV['S3_BUCKET_NAME']
      },

      storage:        :s3,
      s3_headers:     { "Cache-Control" => "max-age=31557600" },
      s3_protocol:    "https",
      bucket:         ENV['S3_BUCKET_NAME'],
      url:            ":s3_domain_url",

      styles: { :content => '800>', :thumb => '118x100#' },

      path:           "/:class/:id/:style/:basename.:extension",
      default_url:    "/:class/:id/:style/:basename.:extension"

  validates_attachment_presence :data
  validates_attachment_size :data, :less_than => 100.megabytes
  do_not_validate_attachment_file_type :data

  def url_thumb
    @url_thumb ||= Ckeditor::Utils.filethumb(filename)
  end
end
