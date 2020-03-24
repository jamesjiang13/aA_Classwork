# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

    # t.date "birth_date", null: false
    # t.string "color", null: false
    # t.string "name", null: false
    # t.string "sex", limit: 1, null: false
    # t.text "description"
    # t.datetime "created_at", null: false
    # t.datetime "updated_at", null: false

Cat.destroy_all

cats = Cat.create! ([
    { birth_date: '1993-02-22', color: 'calico', name: 'Helen', sex: 'F', description: 'I like riddles' },
    { birth_date: '2000-11-24', color: 'red', name: 'Ronil', sex: 'M', description: 'hey yall rowing boats is my thing' },
    { birth_date: '1996-02-22', color: 'calico', name: 'Walker', sex: 'M', description: 'in my spare time I play Animal Crossing' },
    { birth_date: '1994-12-25', color: 'orange', name: 'Vanessa', sex: 'F', description: 'very puzzling' }
])

