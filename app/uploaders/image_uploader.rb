class ImageUploader < CarrierWave::Uploader::Base

  storage :file

  storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end


  def extension_white_list
    %w(jpg jpeg gif png)
  end

  include CarrierWave::RMagick

  process :resize_to_limit => [500, 500]

end
