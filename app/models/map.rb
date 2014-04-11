class Map < ActiveRecord::Base
  belongs_to :application
  has_many :event
  validates :application, presence:true
end
