class Puzzle < ActiveRecord::Base
  belongs_to :image
  validates :name, presence:true
end
