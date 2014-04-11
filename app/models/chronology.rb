class Chronology < ActiveRecord::Base
  belongs_to :application
  has_many :event
  validates :application, presence:true
  before_save :default_values
  def default_values
    self.auto_mode = 'false' if self.auto_mode.nil?
  end
end
