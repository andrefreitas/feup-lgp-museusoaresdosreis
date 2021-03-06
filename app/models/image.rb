class Image < ActiveRecord::Base
  belongs_to :event
  has_one :puzzle

  # Exemplo tirado do outro site. Ainda se tem de ver como funciona.
  def self.uploadFile(upload,hash)
    directory = Rails.root.to_s + "/public/data"
    path = File.join(directory, hash)
    File.open(path, "wb") { |f| f.write(upload.read) }
  end

  def deleteFile
    File.delete(self.path) if File.exist?(self.path)
  end

end
