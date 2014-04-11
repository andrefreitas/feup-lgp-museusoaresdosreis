class Resource < ActiveRecord::Base
  belongs_to :event
  validates :language, presence:true
  validates :event, presence:true
  before_save :default_values
  def default_values
    self.language ||= 0
  end
end
