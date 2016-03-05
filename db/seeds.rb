# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'CREATING ROLES'
["superadmin", "admin_user"].each do |role|
  Role.find_or_create_by(name: role) 
end

puts 'SETTING UP DEFAULT USER LOGIN'

user = User.create(username: 'Admin1', email: 'admin1@businessplan4u.com', password: 'businessplanadmin1')
user.update_attribute(:role_ids, '1')
puts 'New user created: ' << user.username

user2 = User.create(username: 'Admin2', email: 'admin2@businessplan4u.com', password: 'businessplanadmin2')
user2.update_attribute(:role_ids, '2')
puts 'New user created: ' << user2.username

