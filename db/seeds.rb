# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all

u1 = User.create!({username: "DVader"})
u2 = User.create!({username: "HSolo"})
u3 = User.create!({username: "JHut"})

Contact.destroy_all

c1 = Contact.create!({name: "Darth Maul", email: "menace@gmail.com", user_id: u1.id})
c2 = Contact.create!({name: "Leia", email: "princess@gmail.com", user_id: u2.id, favorite: true})
c3 = Contact.create!({name: "Luke Skywalker", email: "skywalker@gmail.com", user_id: u2.id})

ContactShare.destroy_all

cs1 = ContactShare.create!({user_id: u3.id, contact_id: c1.id})
cs2 = ContactShare.create!({user_id: u3.id, contact_id: c2.id})
cs3 = ContactShare.create!({user_id: u3.id, contact_id: c3.id})
cs4 = ContactShare.create!({user_id: u2.id, contact_id: c1.id, favorite: true})
