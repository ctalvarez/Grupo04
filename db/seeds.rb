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

a = Genre.create genre: 'Romance'
b = Genre.create genre: 'Suspense'
c = Genre.create genre: 'Comedy'

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
                    genre: a

d1 = Director.create name: 'Mark Gatiss'

m = Serie.create  name: 'How I met your mother',
                  description: 'asd',
                  user: y,
                  language: :English,
                  country: 'EEUU',
                  private: false,
                  year_release: Date.parse('3/2/1995'),
                  session_amount: 0

n = Serie.create  name: 'Breaking Bad',
                  description: 'Best serie EVER',
                  user: x,
                  language: :English,
                  country: 'EEUU',
                  private: false,
                  year_release: Date.parse('10/10/2000'),
                  session_amount: 0

o = Serie.create  name: 'Sherlock',
                  description: 'Detective story',
                  user: x,
                  language: :English,
                  country: 'UK',
                  private: true,
                  year_release: Date.parse('24/2/2007'),
                  session_amount: 0

p = Serie.create  name: 'Narcos',
                  description: 'plata o plomo',
                  user: z,
                  language: :Spanish,
                  country: 'Colombia',
                  private: false,
                  year_release: Date.parse('19/5/2010'),
                  session_amount: 0

ds = DirectorSeries.create director: d1, serie: o

i = GenreSerie.create genre: a, serie: m  # HIMYM es romance
j = GenreSerie.create genre: c, serie: m  # HIMYM es comedia
k = GenreSerie.create genre: b, serie: n  # BB es suspenso
l = GenreSerie.create genre: b, serie: o  # Sherlock es suspenso
d = GenreSerie.create genre: b, serie: p  # Narcos es suspenso

a1 = Actor.create name: 'Benedict Cumberbatch'
a2 = Actor.create name: 'Louise Brealey'

ActorSeries.create actor: a1, serie: o
ActorSeries.create actor: a2, serie: o

s1 = Session.create date_release: Date.parse('24/4/2000'),
                    status: :Finished,
                    session_number: 1,
                    serie: o
s2 = Session.create date_release: Date.parse('24/4/2001'),
                    status: :OnDemand,
                    session_number: 2,
                    serie: o

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

SubtitleIntegration.create subtitle: s1, serie: o
SubtitleIntegration.create subtitle: s2, serie: o

Seen.create user: x, chapter: c1
