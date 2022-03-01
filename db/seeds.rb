# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create([{username: 'Kyle', password: 'xyzenas'}, {username: 'Marcos', password: 'xyzenas'}])

Task.create([
  {title: 'Mow the lawn', description: 'Mow the backyard lawn and the sides of the house', completed: false, user: User.first},
  {title: 'Read', description: 'Read text books and story books', completed: false, user: User.first},
  {title: 'Exercise', description: 'Engage in some aerobic exercises', completed: true, user: User.second},
  {title: 'Tutorial', description: 'Complete some the online course modules', completed: false, user: User.first},
  {title: 'Evening movies', description: "Watch movies in the evening after I've completed my tasks", completed: true, user: User.second}
])
