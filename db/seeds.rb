# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
2.times do
  [0, 1].each do |role|
    user = User.new
    user.name = Faker::Name.name
    user.email = Faker::Internet.email
    user.password = 'qwerasdf'
    user.password_confirmation = 'qwerasdf'
    user.role = 'admin' if role == 1
    user.save
  end
end