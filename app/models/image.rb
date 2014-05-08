class Image < ActiveRecord::Base
  belongs_to :event
  has_one :puzzle

  # Exemplo tirado do outro site. Ainda se tem de ver como funciona.
  def self.save(upload)
    name =  upload['datafile'].original_filename
    directory = "app/assets/images"
    path = File.join(directory, name)
    File.open(path, "wb") { |f| f.write(upload['datafile'].read) }
  end

end
