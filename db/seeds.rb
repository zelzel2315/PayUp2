# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Bet.create({
# 	string:   "I challenge you to eat 5 McDonald's cheeseburgers in 5 minutes.",
#     float:    1.00,
#     date:     Time.new,
#     date:     Time.new,
#     integer:  1,
#     datetime: Time.new,
#     datetime: Time.new
# })

User.create({
	email: "steve@steve.com",
	first_name: "Steve"
	})

User.create({
	email: "bill@bill.com",
	first_name: "Bill"
	})

# UserBet.create({

# 	})