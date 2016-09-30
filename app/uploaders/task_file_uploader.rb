# encoding: utf-8

class TaskFileUploader < CarrierWave::Uploader::Base
  #[Jerry] remove all of the default content

  #Include RMagick or MiniMagick support:
  #include CarrierWave::RMagic
  include CarrierWave::MiniMagick

  #Include the sprockets-rails Helper for Rails 4+ assset pipeline compatibility
  include Sprockets::Rails::Helper

  #choose what kind of torage to use for this uploader
  #storage :file
  storage :fog

  def store_dir
    #that is a unipue file path in AWS
    "uploader/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Add a white list of extensions which are allowed to be uploaded.
  #For images you might use something like this:
  def extension_white_list
    %w(jpg gif png pdf mp4 wmv xls xlsx doc docx ppt pptx mov)
  end

end
