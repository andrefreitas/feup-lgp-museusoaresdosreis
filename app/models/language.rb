class Language < ActiveRecord::Base
  validates :name, presence:true
  validates :code, presence:true, uniqueness:true, length: { maximum: 2 }
end
