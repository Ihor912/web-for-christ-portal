class ImageUploader < CarrierWave::Uploader::Base

  include Cloudinary::CarrierWave

  process :convert => 'jpg'
  process :tags => ['article_image']
  
  version :standart do
    process :resize_to_fill => [877, 330, :center]
  end

  version :medium do
  	process :resize_to_fill => [400, 180, :center]
  end
  
  version :thumbnail do
    process :resize_to_fill => [50, 50, :center]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end