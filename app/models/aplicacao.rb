class Aplicacao < ActiveRecord::Base
   validates :linguagem, presence: true
   validates :tamanho_texto, presence: true
   has_one :cronologia
   has_one :mapa
   has_many :traducao
   has_many :puzzle
end
