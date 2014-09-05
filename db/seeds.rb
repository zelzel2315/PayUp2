# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Bet.create({
	challenge: "I challenge you to eat 5 McDonald's cheeseburgers in 5 minutes.",
    amount: 1.00,
    challenge_start: Time.new,
    challenge_end: Time.new,
    winner_id: 1,
    created_at: Time.new,
    updated_at: Time.new
})

User.create({
	email: "steve@steve.com",
	first_name: "Steve"
	})

User.create({
	email: "bill@bill.com",
	first_name: "Bill"
	})

UserBet.create({
	bet_id: 1,
	user_id: 1,
	amount: 1.00,
	})





