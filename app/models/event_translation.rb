class EventTranslation < ActiveRecord::Base
  belongs_to :event
  validates :title, presence:true
  validates :content, presence:true
end
