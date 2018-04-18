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

# PB: Getting rid of this...
# unless Rails.env.development?
#  puts "Development seeds only (for now)!"
#  exit 0
# end

# File.open(File.join(Rails.root, 'test.jpg'))

# NOT WORKING PROPERLY (use db:reset instead)
# User.delete_all
# Category.delete_all
# MealRating.delete_all
# MealPosting.delete_all
# UserRating.delete_all

puts "Seeding Users ..."

user1 = User.create!({
 user_status: "Host",
 name: "Lady Gaga",
 email: "lgaga@pokerface.com",
 address: "150 Spadina Avenue Toronto",
 latitude: 43.648701,
 longitude: -79.396531,
 phone_number: 1234567890,
 password: "hashedpass",
 password_confirmation: "hashedpass",
 remote_image_url: "http://res.cloudinary.com/drdumqp4e/image/upload/v1523314174/MV5BNjBjZjA5YzAtM2ZmNS00MTI5LThlOWEtNmJlOTA5MjgwZDkxXkEyXkFqcGdeQXVyNTk1NTMyNzM_._V1_.jpg"
})

user2 = User.create!({
 user_status: "User",
 name: "Denzel Washington",
 email: "denzel@moviestar.com",
 address: "126 Bloor Street West Toronto",
 latitude: 43.669543,
 longitude: -79.392555,
 phone_number: 1098765432,
 password: "passhashed",
 password_confirmation: "passhashed",
 remote_image_url: "http://res.cloudinary.com/drdumqp4e/image/upload/v1523314330/dz2_thumb.jpg"
})

user3 = User.create!({
 user_status: "User",
 name: "Dwayne Johnson",
 email: "dwayne@therock.com",
 address: "379 Queen Street West Toronto",
 latitude: 43.649132,
 longitude: -79.393916,
 phone_number: 1231049384,
 password: "littlerock",
 password_confirmation: "littlerock",
 remote_image_url: "http://res.cloudinary.com/drdumqp4e/image/upload/v1523314303/dwayne-fanny-pack.jpg"
})

user4 = User.create!({
 user_status: "Host",
 name: "Tom Cruise",
 email: "mission@impossible.com",
 address: "300 King Street East Toronto",
 latitude: 43.652398,
 longitude: -79.364664,
 phone_number: 1234567890,
 password: "tommyboy",
 password_confirmation: "tommyboy",
 remote_image_url: "http://res.cloudinary.com/drdumqp4e/image/upload/v1523313753/1341605986_tomcruise-350.jpg"
})

user5 = User.create!({
 user_status: "Host",
 name: "Mike Babcock",
 email: "goleafsgo@email.com",
 address: "282 Bathurst Street Toronto",
 latitude: 43.652546,
 longitude: -79.405175,
 phone_number: 1234567809,
 password: "goleafsgo",
 password_confirmation: "goleafsgo",
 remote_image_url: "http://res.cloudinary.com/drdumqp4e/image/upload/v1523730105/hwbqsdnk9cougvs25x8d.jpg"
})

user6 = User.create!({
 user_status: "Host",
 name: "Liam Neeson",
 email: "taken@baddad.com",
 address: "10 Fort York Blvd Toronto",
 latitude: 43.640735,
 longitude: -79.393842,
 phone_number: 1234567980,
 password: "taken",
 password_confirmation: "taken",
 remote_image_url: "http://res.cloudinary.com/drdumqp4e/image/upload/v1523730046/p97usbc3rmduxm31thtt.jpg"
})

user7 = User.create!({
 user_status: "Host",
 name: "Melissa McCarthy",
 email: "funnylady@email.com",
 address: "280 Spadina Ave Toronto",
 latitude: 43.652649,
 longitude: -79.398556,
 phone_number: 1234567890,
 password: "funnylady",
 password_confirmation: "funnylady",
 remote_image_url: "http://res.cloudinary.com/drdumqp4e/image/upload/v1523730013/Melissa-McCarthy1370206913.jpg"
})

user8 = User.create!({
 user_status: "Host",
 name: "Gordon Ramsay",
 # email: "cheframsay@masterchef.com",
 email: "gdavis111@live.ca"
 address: "200 Bay Street Toronto",
 latitude: 43.646667,
 longitude: -79.379946,
 phone_number: 1234667890,
 password: "masterchef",
 password_confirmation: "masterchef",
 remote_image_url: "http://res.cloudinary.com/drdumqp4e/image/upload/v1523729963/6132HiPT_AL._UX250_.jpg"
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
 base_time: "2018-04-20 16:30:00",
 title: "Chicken Pasta",
 date: DateTime.new(2018, 5, 1, 1),
 description: "Chicken strips, red peppers, onions, cooked in white wine sauce and served over a bed of penne pasta.",
 allergy_notice: "Peanut oil is used in this dish.",
 servings: 5,
 cost: 9.50,
 remote_image_url: "http://res.cloudinary.com/drdumqp4e/image/upload/v1523123384/1467150710-lemon-butter-chicken-pasta-04.jpg"
})


mealposting2 = user1.meal_postings.create!({
 category_id: 3,
 base_time: "2018-04-20 14:30:00",
 end_time: "2018-04-20 17:30:00",
 date: DateTime.new(2018, 5, 1, 1),
 title: "Salmon with Broccoli and Rice",
 description: "Salmon cooked in lemon-garlic oil served with sauteed broccoli and a side of brown rice.",
 allergy_notice: "Let me know if you have any allergies.",
 servings: 7,
 cost: 12.00,
 remote_image_url: "http://res.cloudinary.com/drdumqp4e/image/upload/v1523123122/tz1riiqxm3qa9ixtucoc.jpg"
})

mealposting3 = user4.meal_postings.create!({
 category_id: 6,
 base_time: "2018-04-20 15:30:00",
 title: "Kraft Dinner",
 date: DateTime.new(2018, 5, 1, 1),
 description: "Noodles with cheese powder and a bit of butter and milk.",
 allergy_notice: "Gotta Be KD.",
 servings: 3,
 cost: 18.50,
 remote_image_url: "http://res.cloudinary.com/drdumqp4e/image/upload/v1523123029/bigstock-Homemade-Macaroni-And-Cheese-59176988.jpg"
})

mealposting4 = user4.meal_postings.create!({
 category_id: 3,
 base_time: "2018-04-20 17:30:00",
 title: "Peanut butter and jelly sandwiches",
 date: DateTime.new(2018, 5, 1, 1),
 description: "Two buttered whole wheat pieces of bread, covered in peanut butter and jelly and slapped together.",
 allergy_notice: "Peanut Butter",
 servings: 10,
 cost: 4.25,
 remote_image_url: "http://res.cloudinary.com/drdumqp4e/image/upload/v1523123318/fisaobewqwfp9ey9grnd.jpg"
})

mealposting5 = user5.meal_postings.create!({
 category_id: 3,
 base_time: "2018-04-20 15:30:00",
 end_time: "2018-04-20 18:00:00",
 date: DateTime.new(2018, 5, 1, 1),
 title: "Hotdogs",
 description: "Not sure what kind of meat is in there but it tastes okay.  Includes a bun.",
 allergy_notice: "Dunno what's in it anyways.",
 servings: 15,
 cost: 3.00,
 remote_image_url: "http://res.cloudinary.com/drdumqp4e/image/upload/v1523123150/pjlbqbisxjphpypflk9u.jpg"
})

mealposting6 = user5.meal_postings.create!({
 category_id: 2,
 base_time: "2018-04-20 15:00:00",
 end_time: "2018-04-20 17:00:00",
 date: DateTime.new(2018, 5, 1, 1),
 title: "Fajitas",
 description: "Chicken thighs cut into strips and cooked with peppers, onions and various spices.  Served on a tortilla wrap.",
 allergy_notice: "Let me know if youre allergic to something.",
 servings: 7,
 cost: 7.50,
 remote_image_url: "http://res.cloudinary.com/drdumqp4e/image/upload/v1523123286/Flavorful-Chicken-Fajitas_exps12540_BOS3149327B02_08_5bC_RMS.jpg"
})

mealposting7 = user6.meal_postings.create!({
 category_id: 17,
 base_time: "2018-04-20 16:00:00",
 title: "Ice Cubes",
 date: DateTime.new(2018, 5, 1, 1),
 description: "Fresh mount spring water collected by our aqua gathering engineers and frozen to the perfect temperature into uniform cubes.",
 allergy_notice: "It's frozen water..",
 servings: 25,
 cost: 2.50,
 remote_image_url: "http://res.cloudinary.com/drdumqp4e/image/upload/v1523123061/106595821.jpg"
})

mealposting8 = user6.meal_postings.create!({
 category_id: 3,
 base_time: "2018-04-20 16:00:00",
 title: "Steak Frites",
 date: DateTime.new(2018, 5, 1, 1),
 description: "Classic Alberta beef BBQ'd to a nice medium rare, unless otherwise specified.  Served with fries.",
 allergy_notice: "Let me know.",
 servings: 6,
 cost: 15.00,
 remote_image_url: "http://res.cloudinary.com/drdumqp4e/image/upload/v1523123226/uceisaqtnhfey6gokmrj.jpg"
})

mealposting9 = user7.meal_postings.create!({
 category_id: 17,
 base_time: "2018-04-20 15:00:00",
 end_time: "2018-04-20 17:30:00",
 date: DateTime.new(2018, 5, 1, 1),
 title: "Portobello Mushroom Burgers",
 description: "They're like burgers but less good!  These are a great vegetarian option.",
 allergy_notice: "Let me know about your allergies.",
 servings: 8,
 cost: 8.00,
 remote_image_url: "http://res.cloudinary.com/drdumqp4e/image/upload/v1523123171/fwcwyzfovysbrb4u7bue.jpg"
})

mealposting10 = user7.meal_postings.create!({
 category_id: 17,
 base_time: "2018-04-20 15:00:00",
 end_time: "2018-04-20 17:30:00",
 date: DateTime.new(2018, 5, 1, 1),
 title: "Quinoa",
 description: "Whatever that is.  Served with other healthy stuff as well.",
 allergy_notice: "Let me know about your allergies.",
 servings: 12,
 cost: 7.50,
 remote_image_url: "http://res.cloudinary.com/drdumqp4e/image/upload/v1523123194/ank1h1rgms3zbgcot9so.jpg"
})

mealposting11 = user8.meal_postings.create!({
 category_id: 1,
 base_time: "2018-04-20 15:00:00",
 title: "Spaghetti and Meatballs",
 date: DateTime.new(2018, 5, 1, 1),
 description: "Big ol' plate of spaghetti served with meatballs and covered in marinara sauce.",
 allergy_notice: "Let me know about your allergies.",
 servings: 10,
 cost: 8.25,
 remote_image_url: "http://res.cloudinary.com/drdumqp4e/image/upload/v1523123089/jqhlzqmsugoxuggmpzkl.jpg"
})

mealposting12 = user8.meal_postings.create!({
 category_id: 17,
 base_time: "2018-04-20 15:00:00",
 end_time: "2018-04-20 17:30:00",
 date: DateTime.new(2018, 5, 1, 1),
 title: "Fresh Air",
 description: "Filtered, triple-distilled, fresh air.",
 allergy_notice: "If you are allergic then you have a big problem.",
 servings: 200,
 cost: 2.00,
 remote_image_url: "http://res.cloudinary.com/drdumqp4e/image/upload/v1523123273/1.jpg"
})

puts "Seeding Reservations ..."

mealposting1.reservations.create!({
  user_id: 3,
  number_of_people: 2,
  time: "2018-04-20 11:30:00",
  allergies: "I am allergic to peanuts and almonds.",
  status: "Pending Approval",
  paid: "yes"
})

mealposting6.reservations.create!({
  user_id: 4,
  number_of_people: 1,
  time: "2018-04-20 16:30:00",
  status: "Pending Approval",
  paid: "yes"
})

mealposting2.reservations.create!({
  user_id: 4,
  number_of_people: 3,
  time: "2018-04-20 15:30:00",
  allergies: "Allergic to gluten so I hope this is okay.  Also allergic to Dairy..",
  status: "Pending Approval"
})

mealposting3.reservations.create!({
  user_id: 3,
  number_of_people: 4,
  time: "2018-04-20 12:00:00",
  allergies: "Allergies include fresh air, water, sun, grass, outdoors in general.",
  status: "Pending Approval"
})

mealposting3.reservations.create!({
  user_id: 4,
  number_of_people: 1,
  time: "2018-04-20 11:00:00",
  status: "Pending Approval"
})

mealposting7.reservations.create!({
  user_id: 3,
  number_of_people: 2,
  time: "2018-04-20 12:00:00",
  status: "Pending Approval"
})

mealposting8.reservations.create!({
  user_id: 3,
  number_of_people: 5,
  time: "2018-04-20 13:30:00",
  status: "Rejected"
})


puts "Seeding Meal Ratings ..."

user2.meal_ratings.create!({
 meal_posting: mealposting1,
 comment: "This meal was pretty good and the kitchen and dining area were very clean which was nice.  Lady Gaga is a pretty good host.",
 rating: 7
})

user2.meal_ratings.create!({
 meal_posting: mealposting2,
 comment: "Salmon was overcooked and there was a bug in my broccoli.  Rice was delicious even though I should have stopped eating when I found the bug...",
 rating: 3
})

user3.meal_ratings.create!({
 meal_posting: mealposting1,
 comment: "The Chicken and Peppers and Onions were nice, but to keep fit I avoid eating pasta so maybe I shouldn’t have attended this meal.",
 rating: 6
})

user3.meal_ratings.create!({
 meal_posting: mealposting2,
 comment: "The Salmon was great I just wish I had booked out all of the servings so I could have had more to eat.",
 rating: 8
})

puts "Seeding User Ratings ..."

user1.user_ratings.create!({
 ratee_id: 2,
 rating: 8,
 comment: "Denzel was a treat to have over for dinner.  He is kind, polite, and very clean.  He even offered to help clean up!"
})

user1.user_ratings.create!({
 ratee_id: 3,
 rating: 2,
 comment: "Dwayne insisted we call him ‘The Rock’ the entire time and wouldn’t stop eating.  He spent the whole meal talking about some furious and fast movie franchise.  Dwayne was annoying."
})

user2.user_ratings.create!({
 ratee_id: 1,
 rating: 6,
 comment: "Gaga is a pretty good host.  The decorations were pretty out there but I'm not judging.  Food was pretty good but I'm pretty sure her personal chef made it and not her so I don't know what to say about that."
})

user2.user_ratings.create!({
 ratee_id: 4,
 rating: 3,
 comment: "Tom is a pretty wierd guy.  He seems to be pretty into himself and he insists he is the biggest movie star to ever live.  I think he still believes he is a character out of mission impossible."
})

user3.user_ratings.create!({
 ratee_id: 1,
 rating: 9,
 comment: "Lady Gaga is a class act.  She is all about her fans and just wants people to be happy and accepting. Great host."
})

user4.user_ratings.create!({
 ratee_id: 2,
 rating: 7,
 comment: "Denzel was a good time!  We talked about how we were both super big movie stars and stuff.  Scientology WOOOO! -Special Agent Tom Cruise"
})

user4.user_ratings.create!({
 ratee_id: 3,
 rating: 4,
 comment: "Dwayne isn't even that big.  I could probably bench more than him.  I think I am in better shape than Dwayne. -Special Agent Tom Cruise"
})

user5.user_ratings.create!({
 ratee_id: 6,
 rating: 8,
 comment: "Liam is a badass.  I heard he once had his daughter taken 3 times in 3 movies and managed to get her back every time.  I feel like he should be more careful from now on so there isn't a 'Taken 4'."
})

user6.user_ratings.create!({
 ratee_id: 5,
 rating: 10,
 comment: "Mike seems like a hard-working, no-nonsense type of guy which I like.  He also has a great palate in the kitchen.  Great spices!"
})

user7.user_ratings.create!({
 ratee_id: 8,
 rating: 1,
 comment: "Gordon is a jerk.  He just yelled at me the whole time for making mistakes."
})

user8.user_ratings.create!({
 ratee_id: 1,
 rating: 2,
 comment: "HORRIBLE, BAD, WOULDN'T FEED IT TO MY DOG! -Gordon Ramsay"
})

user8.user_ratings.create!({
 ratee_id: 4,
 rating: 2,
 comment: "HORRIBLE, BAD, WOULDN'T FEED IT TO MY DOG! -Gordon Ramsay"
})

user8.user_ratings.create!({
 ratee_id: 5,
 rating: 2,
 comment: "HORRIBLE, BAD, WOULDN'T FEED IT TO MY DOG! -Gordon Ramsay"
})

user8.user_ratings.create!({
 ratee_id: 6,
 rating: 2,
 comment: "HORRIBLE, BAD, WOULDN'T FEED IT TO MY DOG! -Gordon Ramsay"
})


