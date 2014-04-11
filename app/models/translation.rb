class Translation < ActiveRecord::Base
  belongs_to :application
  has_many :field
  validates :language, presence:true
  validates :application, presence:true
end
