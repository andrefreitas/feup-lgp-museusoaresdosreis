class EventTranslation < ActiveRecord::Base
  belongs_to :event
  has_many :image_translation, dependent: :destroy
  validates :lang, presence:true
end
