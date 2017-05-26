# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
GenreSerie.destroy_all
Genre.destroy_all
Serie.destroy_all
User.destroy_all

a = Genre.create genre: 'Romance'
b = Genre.create genre: 'Suspenso'
c = Genre.create genre: 'Comedia'

x = User.create name: 'David', email: 'daruz@uc.cl', password: 'qwerty', rol: :admin
y = User.create name: 'Felipe', email: 'figarrido@uc.cl', password: 'qwerty', rol: :admin
z = User.create name: 'Carlos', email: 'ctalvarez@uc.cl', password: 'qwerty', rol: :admin

m = Serie.create  name: 'How I met your mother',
                  description: 'asd',
                  user: y,
                  language: Serie.languages[:English],
                  private: false

n = Serie.create  name: 'Breaking Bad',
                  description: 'Best serie EVER',
                  user: x,
                  language: Serie.languages[:English],
                  private: false

o = Serie.create  name: 'The Flash',
                  description: 'Flaaaasshhh',
                  user: x,
                  language: Serie.languages[:English],
                  private: true

p = Serie.create  name: 'Narcos',
                  description: 'plata o plomo',
                  user: z,
                  language: Serie.languages[:Spanish],
                  private: false


i = GenreSerie.create genre: a, serie: m  # HIMYM es romance
j = GenreSerie.create genre: c, serie: m  # HIMYM es comedia
k = GenreSerie.create genre: b, serie: n  # BB es suspenso
l = GenreSerie.create genre: b, serie: o  # Flash es suspenso
d = GenreSerie.create genre: b, serie: p  # Narcos es suspenso
