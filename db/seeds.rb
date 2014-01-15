# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

a = AdminUser.new
a.email = 'admin@exec.io'
if Rails.env.production?
  password = Digest::SHA1.hexdigest(rand(Time.now.to_f.to_s))
else
  password = 'password'
end
a.password = password
a.password_confirmation = password
a.save!
