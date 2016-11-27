# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create([
{ name: 'ted', password: "asdf", password_confirmation: "asdf"},
{ name: 'jane', password: "asdf", password_confirmation: "asdf"},
{ name: 'chuck', password: "asdf", password_confirmation: "asdf"},
{ name: 'joe',  password: "asdf", password_confirmation: "asdf"},
{ name: 'sue', password: "asdf", password_confirmation: "asdf"}
])
