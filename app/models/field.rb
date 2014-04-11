class Field < ActiveRecord::Base
  belongs_to :translation
  validates :translation, presence:true
end
