# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Seeding Data ..."

# Only run on development (local) instances not on production, etc.
# IS THIS NEEDED? ################
unless Rails.env.development?
 puts "Development seeds only (for now)!"
 exit 0
end


# NOT WORKING PROPERLY
Category.delete_all
MealRating.delete_all
MealPosting.delete_all
UserRating.delete_all
User.delete_all

puts "Seeding Users ..."

user1 = User.create!({
 user_status: "host",
 name: "Lady Gaga",
 email: "lgaga@pokerface.com",
 address: "150 Spadina Avenue Toronto",
 phone_number: 1234567890,
 password: "hashedpass",
 password_confirmation: "hashedpass",
 image: "http://res.cloudinary.com/drdumqp4e/image/upload/v1523314174/MV5BNjBjZjA5YzAtM2ZmNS00MTI5LThlOWEtNmJlOTA5MjgwZDkxXkEyXkFqcGdeQXVyNTk1NTMyNzM_._V1_.jpg"
})

user2 = User.create!({
 user_status: "user",
 name: "Denzel Washington",
 email: "denzel@moviestar.com",
 address: "126 Bloor Street West Toronto",
 phone_number: 1098765432,
 password: "passhashed",
 password_confirmation: "passhashed",
 image: "http://res.cloudinary.com/drdumqp4e/image/upload/v1523314330/dz2_thumb.jpg"
})

user3 = User.create!({
 user_status: "user",
 name: "Dwayne Johnson",
 email: "dwayne@therock.com",
 address: "379 Queen Street West Toronto",
 phone_number: 1231049384,
 password: "littlerock",
 password_confirmation: "littlerock",
 image: "http://res.cloudinary.com/drdumqp4e/image/upload/v1523314303/dwayne-fanny-pack.jpg"
})

user4 = User.create!({
 user_status: "host",
 name: "Tom Cruise",
 email: "mission@impossible.com",
 address: "300 King Street East Toronto",
 phone_number: 1234567890,
 password: "tommyboy",
 password_confirmation: "tommyboy",
 image: "http://res.cloudinary.com/drdumqp4e/image/upload/v1523313753/1341605986_tomcruise-350.jpg"
})

puts "Seeding Categories ..."


cat1 = Category.create!({
 name: "Italian"
})

cat2 = Category.create!({
 name: "Mexican"
})

cat3 = Category.create!({
 name: "American"
})

cat4 = Category.create!({
 name: "Caribbean"
})

cat5 = Category.create!({
 name: "British"
})

cat6 = Category.create!({
 name: "Chinese"
})

cat7 = Category.create!({
 name: "French"
})

cat8 = Category.create!({
 name: "Greek"
})

cat9 = Category.create!({
 name: "Indian"
})

cat10 = Category.create!({
 name: "Japanese"
})

cat11 = Category.create!({
 name: "Mediterranean"
})

cat12 = Category.create!({
 name: "Moroccan"
})

cat13 = Category.create!({
 name: "Spanish"
})

cat14 = Category.create!({
 name: "Thai"
})

cat15 = Category.create!({
 name: "Turkish"
})

cat16 = Category.create!({
 name: "Vietnamese"
})

cat17 = Category.create!({
 name: "Vegetarian"
})

# has_many_through

# 1:Italian, 2:Mexican, 3:American, 4:Caribbean, 5:British, 6:Chinese, 7:French, 8:Greek, 9:Indian
# 10:Japanese, 11:Mediterranean, 12:Moroccan, 13:Spanish, 14:Thai, 15:Turkish, 16:Vietnamese, 17:Vegetarian

puts "Seeding Meal Postings ..."

mealposting1 = user1.meal_postings.create!({
 category_id: 1,
 base_time: 630,
 title: "Chicken Pasta",
 description: "Chicken strips, red peppers, onions, cooked in white wine sauce and served over a bed of penne pasta.",
 allergy_notice: "Peanut oil is used in this dish.",
 servings: 5,
 cost: 9.50
})


mealposting2 = user1.meal_postings.create!({
 category_id: 3,
 base_time: 430,
 end_time: 730,
 title: "Salmon with Broccoli and Rice",
 description: "Salmon cooked in lemon-garlic oil served with sauteed broccoli and a side of brown rice.",
 allergy_notice: "Let me know if you have any allergies.",
 servings: 7,
 cost: 12.00
})

mealposting3 = user2.meal_postings.create!({
 category_id: 6,
 base_time: 530,
 title: "Kraft Dinner",
 description: "Noodles with cheese powder and a bit of butter and milk.",
 allergy_notice: "Gotta Be KD.",
 servings: 3,
 cost: 18.50
})

mealposting4 = user2.meal_postings.create!({
 category_id: 3,
 base_time: 730,
 title: "Peanut butter and jelly sandwiches",
 description: "Two buttered whole wheat pieces of bread, covered in peanut butter and jelly and slapped together.",
 allergy_notice: "Peanut Butter",
 servings: 10,
 cost: 4.25
})

mealposting5 = user3.meal_postings.create!({
 category_id: 3,
 base_time: 530,
 end_time: 800,
 title: "Hotdogs",
 description: "Not sure what kind of meat is in there but it tastes okay.  Includes a bun.",
 allergy_notice: "Dunno what's in it anyways.",
 servings: 15,
 cost: 3.00
})

mealposting6 = user1.meal_postings.create!({
 category_id: 2,
 base_time: 500,
 end_time: 700,
 title: "Fajitas",
 description: "Chicken thighs cut into strips and cooked with peppers, onions and various spices.  Served on a tortilla wrap.",
 allergy_notice: "Let me know if youre allergic to something.",
 servings: 7,
 cost: 7.50
})

mealposting7 = user3.meal_postings.create!({
 category_id: 17,
 base_time: 600,
 title: "Ice Cubes",
 description: "Fresh mount spring water collected by our aqua gathering engineers and frozen to the perfect temperature into uniform cubes.",
 allergy_notice: "It's frozen water..",
 servings: 25,
 cost: 2.50
})

mealposting8 = user4.meal_postings.create!({
 category_id: 3,
 base_time: 600,
 title: "Steak Frites",
 description: "Classic Alberta beef BBQ'd to a nice medium rare, unless otherwise specified.  Served with fries.",
 allergy_notice: "Let me know.",
 servings: 6,
 cost: 15.00
})

mealposting9 = user4.meal_postings.create!({
 category_id: 17,
 base_time: 500,
 end_time: 730,
 title: "Portobello Mushroom Burgers",
 description: "They're like burgers but less good!  These are a great vegetarian option.",
 allergy_notice: "Let me know about your allergies.",
 servings: 8,
 cost: 8.00
})

mealposting10 = user4.meal_postings.create!({
 category_id: 17,
 base_time: 500,
 end_time: 730,
 title: "Quinoa",
 description: "Whatever that is.  Served with other healthy stuff as well.",
 allergy_notice: "Let me know about your allergies.",
 servings: 12,
 cost: 7.50
})

mealposting11 = user4.meal_postings.create!({
 category_id: 1,
 base_time: 500,
 title: "Spaghetti and Meatballs",
 description: "Big ol' plate of spaghetti served with meatballs and covered in marinara sauce.",
 allergy_notice: "Let me know about your allergies.",
 servings: 10,
 cost: 8.25
})

mealposting12 = user4.meal_postings.create!({
 category_id: 17,
 base_time: 500,
 end_time: 730,
 title: "Fresh Air",
 description: "Filtered, triple-distilled, fresh air.",
 allergy_notice: "If you are allergic then you have a big problem.",
 servings: 200,
 cost: 2.00
})

puts "Seeding Media ..."

mealposting1.media.create!({
  url: "http://res.cloudinary.com/drdumqp4e/image/upload/v1523123384/1467150710-lemon-butter-chicken-pasta-04.jpg"
})

mealposting2.media.create!({
  url: "http://res.cloudinary.com/drdumqp4e/image/upload/v1523123122/tz1riiqxm3qa9ixtucoc.jpg"
})

mealposting3.media.create!({
  url: "http://res.cloudinary.com/drdumqp4e/image/upload/v1523123029/bigstock-Homemade-Macaroni-And-Cheese-59176988.jpg"
})

mealposting4.media.create!({
  url: "http://res.cloudinary.com/drdumqp4e/image/upload/v1523123318/fisaobewqwfp9ey9grnd.jpg"
})

mealposting5.media.create!({
  url: "http://res.cloudinary.com/drdumqp4e/image/upload/v1523123150/pjlbqbisxjphpypflk9u.jpg"
})

mealposting6.media.create!({
  url: "http://res.cloudinary.com/drdumqp4e/image/upload/v1523123286/Flavorful-Chicken-Fajitas_exps12540_BOS3149327B02_08_5bC_RMS.jpg"
})

mealposting7.media.create!({
  url: "http://res.cloudinary.com/drdumqp4e/image/upload/v1523123061/106595821.jpg"
})

mealposting8.media.create!({
  url: "http://res.cloudinary.com/drdumqp4e/image/upload/v1523123226/uceisaqtnhfey6gokmrj.jpg"
})

mealposting9.media.create!({
  url: "http://res.cloudinary.com/drdumqp4e/image/upload/v1523123171/fwcwyzfovysbrb4u7bue.jpg"
})

mealposting10.media.create!({
  url: "http://res.cloudinary.com/drdumqp4e/image/upload/v1523123194/ank1h1rgms3zbgcot9so.jpg"
})

mealposting11.media.create!({
  url: "http://res.cloudinary.com/drdumqp4e/image/upload/v1523123089/jqhlzqmsugoxuggmpzkl.jpg"
})

mealposting12.media.create!({
  url: "http://res.cloudinary.com/drdumqp4e/image/upload/v1523123273/1.jpg"
})

puts "Seeding Meal Ratings ..."

user2.meal_ratings.create!({
 meal_posting: mealposting1,
 comment: "This meal was pretty good and the kitchen and dining area were very clean which was nice.  Lady Gaga is a pretty good host.",
 rating: 7.5
})

user2.meal_ratings.create!({
 meal_posting: mealposting2,
 comment: "Salmon was overcooked and there was a bug in my broccoli.  Rice was delicious even though I should have stopped eating when I found the bug...",
 rating: 3.5
})

user3.meal_ratings.create!({
 meal_posting: mealposting1,
 comment: "The Chicken and Peppers and Onions were nice, but to keep fit I avoid eating pasta so maybe I shouldn’t have attended this meal.",
 rating: 6
})

user3.meal_ratings.create!({
 meal_posting: mealposting2,
 comment: "The Salmon was great I just wish I had booked out all of the servings so I could have had more to eat.",
 rating: 8.5
})

puts "Seeding User Ratings ..."

user1.user_ratings.create!({
 ratee_id: 2,
 rating: 8,
 comment: "Denzel was a treat to have over for dinner.  He is kind, polite, and very clean.  He even offered to help clean up!"
})

user1.user_ratings.create!({
 ratee_id: 3,
 rating: 2.5,
 comment: "Dwayne insisted we call him ‘The Rock’ the entire time and wouldn’t stop eating.  He spent the whole meal talking about some furious and fast movie franchise.  Dwayne was annoying."
})
