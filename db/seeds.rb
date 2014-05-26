#encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Administrator.create(name: "André Freitas", email: "p.andrefreitas@gmail.com", password: "123456")
Administrator.create(name: "Rafael Vieira", email: "frpv74@gmail.com", password: "123456")
Administrator.create(name: "Henrique Teixeira", email: "henriqmteixeira@gmail.com", password: "123456")

Language.create(name: "Português", code:"pt")