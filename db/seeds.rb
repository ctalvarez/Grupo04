# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rails db:seed command (or created
# alongside the database with db:setup).
#
# Examples:
#
#  movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#  Character.create(name: 'Luke', movie: movies.first)
ActorSeries.destroy_all
Actor.destroy_all
Chapter.destroy_all
ChildFilter.destroy_all
DirectorSeries.destroy_all
Director.destroy_all
GenreSerie.destroy_all
Genre.destroy_all
ParentChild.destroy_all
Score.destroy_all
Seen.destroy_all
Serie.destroy_all
Session.destroy_all
SubtitleIntegration.destroy_all
Subtitle.destroy_all
User.destroy_all

romance = Genre.create genre: 'Romance'
suspense = Genre.create genre: 'Suspense'
comedy = Genre.create genre: 'Comedy'
action = Genre.create genre: 'Action'
terror = Genre.create genre: 'Terror'
drama = Genre.create genre: 'Drama'


x = User.create name: 'David',
                email: 'daruz@uc.cl',
                password: 'qwerty',
                rol: :admin

y = User.create name: 'Felipe',
                email: 'figarrido@uc.cl',
                password: 'qwerty',
                rol: :admin

z = User.create name: 'Carlos',
                email: 'ctalvarez@uc.cl',
                password: 'qwerty',
                rol: :admin

u1 = User.create  name: 'Juanito',
                  email: 'j@gmail.com',
                  password: 'qwerty',
                  rol: :child

ParentChild.create  parent: y,
                    child: u1

ChildFilter.create  user: u1,
                    genre: action

d1 = Director.create name: 'Mark Gatiss'

himym = Serie.create  name: 'How I met your mother',
                  description: 'asd',
                  user: y,
                  language: :English,
                  country: 'EEUU',
                  private: false,
                  year_release: Date.parse('3/2/1995'),
                  session_amount: 0

breakigBad = Serie.create  name: 'Breaking Bad',
                  description: 'Best serie EVER',
                  user: x,
                  language: :English,
                  country: 'EEUU',
                  private: false,
                  year_release: Date.parse('10/10/2000'),
                  session_amount: 0

sherlock = Serie.create  name: 'Sherlock',
                  description: 'In this modernized version of the Conan Doyle characters, using his detective plots, Sherlock Holmes lives in early 21st century London and acts more cocky towards Scotland Yard\'s detective inspector Lestrade because he\'s actually less confident. Doctor Watson is now a fairly young veteran of the Afghan war, less adoring and more active. Written by KGF Vissers',
                  user: x,
                  language: :English,
                  country: 'UK',
                  private: true,
                  year_release: Date.parse('24/2/2007'),
                  session_amount: 0

narcos = Serie.create  name: 'Narcos',
                  description: 'plata o plomo',
                  user: z,
                  language: :Spanish,
                  country: 'Colombia',
                  private: false,
                  year_release: Date.parse('19/5/2010'),
                  session_amount: 0

houseOfCards = Serie.create  name: 'House of Cards',
                  description: 'frank underwood president',
                  user: z,
                  language: :English,
                  country: 'EEUU',
                  private: false,
                  year_release: Date.parse('10/10/2011'),
                  session_amount: 0

gameOfThrones = Serie.create  name: 'Game of Thrones',
                  description: 'winter is comming',
                  user: z,
                  language: :English,
                  country: 'EEUU',
                  private: false,
                  year_release: Date.parse('12/7/2012'),
                  session_amount: 0

scream = Serie.create name: 'Scream',
                      description: 'Crime and Murder',
                      user: z,
                      language: :English,
                      country: 'EEUU',
                      private: false,
                      year_release: Date.parse('11/11/2015'),
                      session_amount: 0

rickAndMorty = Serie.create name: 'Rick y Morty',
                      description: 'Wubba Lubba dub-dub',
                      user: z,
                      language: :English,
                      country: 'EEUU',
                      private: false,
                      year_release: Date.parse('9/10/2014'),
                      session_amount: 0

ds = DirectorSeries.create director: d1, serie: sherlock

gs1 = GenreSerie.create genre: romance, serie: himym  # HIMYM es romance
gs2 = GenreSerie.create genre: comedy, serie: himym  # HIMYM es comedia
gs3 = GenreSerie.create genre: suspense, serie: breakigBad  # BB es suspenso
gs3 = GenreSerie.create genre: drama, serie: breakigBad  # BB es drama
gs4 = GenreSerie.create genre: suspense, serie: sherlock  # Sherlock es suspenso
gs5 = GenreSerie.create genre: drama, serie: narcos  # Narcos es drama
gs6 = GenreSerie.create genre: action, serie: narcos  # Narcos es action
gs7 = GenreSerie.create genre: drama, serie: houseOfCards  # House of cards es drama
gs8 = GenreSerie.create genre: action, serie: gameOfThrones  # got es action
gs9 = GenreSerie.create genre: drama, serie: gameOfThrones  # got es drama
gs10 = GenreSerie.create genre: suspense, serie: gameOfThrones  # got es suspenso
gs11 = GenreSerie.create genre: terror, serie: scream  # scream es terror
gs12 = GenreSerie.create genre: suspense, serie: scream  # scream es susoenso
gs13 = GenreSerie.create genre: comedy, serie: rickAndMorty  # scream es susoenso

a1 = Actor.create name: 'Benedict Cumberbatch'
a2 = Actor.create name: 'Louise Brealey'

ActorSeries.create actor: a1, serie: sherlock
ActorSeries.create actor: a2, serie: sherlock

s1 = Session.create date_release: Date.parse('24/4/2000'),
                    status: :Finished,
                    session_number: 1,
                    serie: sherlock
s2 = Session.create date_release: Date.parse('24/4/2001'),
                    status: :OnDemand,
                    session_number: 2,
                    serie: sherlock

c1 = Chapter.create name: 'Chapter 1',
                    description: 'asd',
                    session: s1,
                    duration: 45
c2 = Chapter.create name: 'Chapter 2',
                    description: 'asd',
                    session: s2,
                    duration: 60
c3 = Chapter.create name: 'Chapter 3',
                    description: 'asd',
                    session: s2,
                    duration: 45

s1 = Subtitle.create language: 'Spanish'
s2 = Subtitle.create language: 'French'

SubtitleIntegration.create subtitle: s1, serie: sherlock
SubtitleIntegration.create subtitle: s2, serie: sherlock

Seen.create user: x, chapter: c1
