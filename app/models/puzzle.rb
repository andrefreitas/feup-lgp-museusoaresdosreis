class Puzzle < ActiveRecord::Base
  belongs_to :application
  validates :image, presence:true
  validates :application, presence:true
  # Talvez meter imagem default
end
