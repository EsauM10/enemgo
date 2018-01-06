class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  process resize_to_limit: [200, 200]

  version :thumb do
    process resize_to_fit: [80, 80]
  end

  def extension_whitelist
    %w(jpg jpeg png)
  end

end
