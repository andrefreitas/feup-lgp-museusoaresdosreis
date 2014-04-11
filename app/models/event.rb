class Event < ActiveRecord::Base
  belongs_to :chronology
  belongs_to :map
  has_many :resource
  validates :local, presence: true
  validates :chronology, presence:true
  validates :map, presence:true
  before_save :default_values
  def default_values
    self.published = 'false' if self.published.nil?
    self.visible = 'false' if self.visible.nil?
  end
end
