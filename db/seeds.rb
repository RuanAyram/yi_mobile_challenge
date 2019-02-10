# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# My locations
my_locations = {
  encontro_dos_rios: { lat: -5.035264,lng: -42.8413766},
  potycabana: { lat: -5.0845239, lng: -42.7947056 },
  theresina_hall: { lat: -5.0608837, lng: -42.8076101 }
}

puts '#### EVENTS'
Event.create!(
  name: 'Emicida',
  description: 'Show do Emicida no Parque Potycabana - 1kg de alimento',
  lat: my_locations[:potycabana][:lat],
  lng: my_locations[:potycabana][:lng]
)

Event.create!(
  name: 'Encontro dos Rios',
  description: 'Venha ver o encontro do Rio Poty com o Rio Parnaíba',
  lat: my_locations[:encontro_dos_rios][:lat],
  lng: my_locations[:encontro_dos_rios][:lng]
)

Event.create!(
  name: 'O Poder da Ação',
  description: 'Palestra de Paulo Vieira em Teresina',
  lat: my_locations[:theresina_hall][:lat],
  lng: my_locations[:theresina_hall][:lng]
)

puts '#### USERS'
User.create!(
  name: 'Ruan Kaylo',
  email: 'ruan.kaylo@gmail.com',
  password: '123456789'
)

User.create!(
  name: 'Mussum Ipsum',
  email: 'mussum_ipsum@teste.com',
  password: '123456789'
)

puts '#### COMMENTS'
comment_count = 1
20.times do
  user = User.all.sample
  event = Event.all.sample
  comment = Comment.new(
    text: "#{comment_count} - Mussum Ipsum: Interessantiss quisso pudia ce receita de bolis, mais bolis eu num gostis.",
    user: user,
    event: event
  )
  comment_count += 1

  if user.id == 2
    comment.flagged = true
  end

  comment.save!

  Report.create!(user: user, comment: comment)
end
