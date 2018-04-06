# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Seeding Data ..."


# Only run on development (local) instances not on production, etc.
unless Rails.env.development?
 puts "Development seeds only (for now)!"
 exit 0
end

puts "Seeding Users ..."

# MealPosting.destroy_all
# User.destroy_all
# UserRating.destroy_all
# Category.destroy_all
# MealRating.destroy_all

user1 = User.create!({
 user_status: "host",
 name: "Lady Gaga",
 email: "lgaga@pokerface.com",
 address: "123 Gaga Lane",
 phone_number: 1234567890,
 password_digest: "hashedpass"
})

user2 = User.create!({
 user_status: "user",
 name: "Denzel Washington",
 email: "denzel@moviestar.com",
 address: "123 Action Blvd",
 phone_number: 1098765432,
 password_digest: "passhashed"
})

user3 = User.create!({
 user_status: "user",
 name: "Dwayne Johnson",
 email: "dwayne@therock.com",
 address: "The Gym",
 phone_number: 1231049384,
 password_digest: "littlerock"
})

puts "Seeding Categories ..."


cat1 = Category.create!({
 name: "Italian"
})

cat2 = Category.create!({
 name: "Mexican"
})

cat3 = Category.create!({
 name: "Asian"
})

cat4 = Category.create!({
 name: "American"
})

cat5 = Category.create!({
 name: "Fusion"
})

puts "Seeding Meal Postings ..."


mealposting1 = user1.meal_postings.create!({
 base_time: 630,
 title: "Chicken Pasta",
 description: "Chicken strips, red peppers, onions, cooked in tomato sauce and served over a bed of penne pasta.",
 allergy_notice: "Peanut oil is used in this dish.",
 servings: 5,
 cost: 9.50
})

mealposting2 = user1.meal_postings.create!({
 base_time: 430,
 end_time: 730,
 title: "Salmon with Broccoli and Rice",
 description: "Salmon cooked in lemon-garlic oil served with sauteed broccoli and a side of brown rice.",
 allergy_notice: "Let me know if you have any allergies.",
 servings: 7,
 cost: 12.00
})

puts "Seeding Meal Ratings ..."


user2.meal_ratings.create!({
 meal_posting_id: 1,
 comment: "This meal was pretty good and the kitchen and dining area were very clean which was nice.  Lady Gaga is a pretty good host.",
 rating: 7.5
})

user2.meal_ratings.create!({
 meal_posting_id: 2,
 comment: "Salmon was overcooked and there was a bug in my broccoli.  Rice was delicious even though I should have stopped eating when I found the bug...",
 rating: 3.5
})

user3.meal_ratings.create!({
 meal_posting_id: 1,
 comment: "The Chicken and Peppers and Onions were nice, but to keep fit I avoid eating pasta so maybe I shouldn’t have attended this meal.",
 rating: 6
})

user3.meal_ratings.create!({
 meal_posting_id: 2,
 comment: "The Salmon was great I just wish I had booked out all of the servings so I could have had more to eat.",
 rating: 8.5
})

puts "Seeding User Ratings ..."


user1.user_ratings.create!({
 ratee_id: 2,
 rating: 8,
 comment: "Denzel was a treat to have over for dinner.  He is kind, polite, and a very clean.  He even offered to help clean up!"
})

user1.user_ratings.create!({
 ratee_id: 3,
 rating: 2.5,
 comment: "Dwayne insisted we call him ‘The Rock’ the entire time and wouldn’t stop eating.  He spent the whole meal talking about some furious and fast movie franchise.  Dwayne was annoying."
})