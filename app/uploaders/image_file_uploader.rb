# encoding: utf-8

class ImageFileUploader < CarrierWave::Uploader::Base

  # RMagick, MiniMagick are not necessary in this app
  # since it uses command-line input via MojoMagick.

  # Kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Directory for uploaded files:
  def store_dir
    "uploads/pictures/#{model.id}"
    # Don't include "public/" in filepath, it's in the public/ directory by implication.
  end

  # Override the filename of the uploaded files:
  def filename
    "uploaded_image" if original_filename
  end
  
  # White list of extensions which are allowed to be uploaded:
  def extension_white_list
    %w(jpg jpeg gif png) # Gives error message on webpage if upload a different filetype.
  end
  
  # Create thumbnails in the controller. 
  # Use a MojoMagick scale-down-to-fit command.
  # Or use SimpleForm Fancy Uploads?

  
end
