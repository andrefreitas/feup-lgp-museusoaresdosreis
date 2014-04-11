class Application < ActiveRecord::Base
   validates :language, presence: true
   validates :text_size, presence: true
   has_one :chronology
   has_one :map
   has_many :translation
   has_many :puzzle
end
