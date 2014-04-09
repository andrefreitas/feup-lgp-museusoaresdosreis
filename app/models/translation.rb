class Translation < ActiveRecord::Base
  belongs_to :application
  has_many :field
end
