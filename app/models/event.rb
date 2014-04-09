class Event < ActiveRecord::Base
  belongs_to :chronology
  belongs_to :map
  has_many :resource
end
