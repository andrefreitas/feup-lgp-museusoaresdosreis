class EventTranslation < ActiveRecord::Base
  belongs_to :event
  validates :lang, presence:true
end
