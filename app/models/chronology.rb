class Chronology < ActiveRecord::Base
  belongs_to :application
  has_many :event
end
