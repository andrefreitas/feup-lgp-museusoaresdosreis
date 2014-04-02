class Evento < ActiveRecord::Base
  belongs_to :cronologia
  belongs_to :mapa
  has_many :recurso
end
