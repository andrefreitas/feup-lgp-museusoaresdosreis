class Traducao < ActiveRecord::Base
  belongs_to :aplicacao
  has_many :campo
end
