class Application < ActiveRecord::Base
   has_one :chronology
   has_one :map
   has_many :translation
   has_many :puzzle
   before_save :default_values
   def default_values
     self.text_size ||= 12
     self.language ||= 0
   end
end
