class Administrador < ActiveRecord::Base
  validates :nome, presence: true, length: { maximum: 40 }
  validates :login, presence: true, length: { maximum: 15 }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
end
