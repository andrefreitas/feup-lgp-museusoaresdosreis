class Event < ActiveRecord::Base
  belongs_to :chronology
  belongs_to :map
  has_many :images, dependent: :destroy
  has_many :event_translation
  validates :title, presence:true
  #validates :content, presence:true
  #validates :chronology, presence:true
  #validates :map, presence:true
  before_save :default_values

  def default_values
    self.published = 'false' if self.published.nil?
    self.public = 'false' if self.public.nil?
  end

  # Returns all the locations within a search term
  def self.listLocations(searchTerm)
    Event.where(["local REGEXP :term", {:term => searchTerm}]).map(&:local)
  end
end
