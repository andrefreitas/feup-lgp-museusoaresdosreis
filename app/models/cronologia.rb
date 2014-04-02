class Cronologia < ActiveRecord::Base
   belongs_to :aplicacao
   has_many :evento
end
