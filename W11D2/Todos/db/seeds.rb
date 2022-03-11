# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Todo.destroy_all

nap = Todo.create!(title: "nap", body: "Sleepy time", done: false)
feed_cats = Todo.create!(title: "feed cats", body: "Give them something to eat", done: false)
buy_turkey = Todo.create!(title: "buy turkey", body: "Protein time", done: false)
code = Todo.create!(title: "Code", body: "AA grindset", done: false)
