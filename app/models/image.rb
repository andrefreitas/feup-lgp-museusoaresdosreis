class Image < ActiveRecord::Base
  belongs_to :event
  has_one :puzzle

  # Exemplo tirado do outro site. Ainda se tem de ver como funciona.
  def self.uploadFile(upload)
    name =  upload.original_filename
    directory = "public/data"
    path = File.join(directory, name)
    File.open(path, "wb") { |f| f.write(upload.read) }
  end

  def deleteFile
    File.delete(self.path) if File.exist?(self.path)
  end

end
