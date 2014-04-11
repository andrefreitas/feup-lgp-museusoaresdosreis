class Video < Resource
  validates :filename, presence:true
  validates :duration ,presence:true
end
