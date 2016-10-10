# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

user = User.create!(email: "#{SecureRandom.uuid}@example.com", password: 'password')

user.location_payloads.create!([
  {timestamp_at: Time.now, speed: 0, latitude: 42.765399, longitude: -71.467564}, # Nashua, NH
  {timestamp_at: Time.now, speed: 0, latitude: 42.346676, longitude: -71.097218}, # Fenway
  {timestamp_at: Time.now, speed: 0, latitude: 40.825629, longitude: -73.930238}, # Yankee Stadium
  {timestamp_at: Time.now, speed: 0, latitude: 35.292351, longitude: -81.535646}, # Eastbound & Down
  {timestamp_at: Time.now, speed: 0, latitude: 30.267153, longitude: -97.743061}, # Austin, TX
  {timestamp_at: Time.now, speed: 0, latitude: 39.529633, longitude: -119.813803}, # Reno 911
  {timestamp_at: Time.now, speed: 0, latitude: 45.523062, longitude: -122.676482}, # Portlandia
  {timestamp_at: Time.now, speed: 0, latitude: 46.877186, longitude: -96.789803}, # Fargo
  {timestamp_at: Time.now, speed: 0, latitude: 44.665206, longitude: -63.567743}, # Trailer Park Boys
  {timestamp_at: Time.now, speed: 0, latitude: 44.966741, longitude: -72.13829}, # Super Troopers
])
