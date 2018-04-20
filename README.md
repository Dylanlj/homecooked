# HomeCooked

## Summary

HomeCooked is a website for those who love cooking and want to share their creations with other people and potentially make some money on the side. After a host creates a meal posting users can then reserve and attend meals or pickup meals from the hosts. The Google Maps api allows users to find food based on their location and SendGrid sends an email notifying hosts when a reservation has been made.

## Screenshots
["HomePage"](https://github.com/bartnic1/homecooked/blob/master/docs/front-page.png)
["Reserving a meal"](https://github.com/bartnic1/homecooked/blob/master/docs/reserve-a-meal.png)

## Setup
1. Fork & Clone
2. Run bundle install to install dependencies
3. Create psql database
4. bin/rake db:reset
5. signup for a stripe account and add the public and secret keys to a .ENV file
6. run rails s
7. go to http://localhost:3000/

Or simply go to https://serene-woodland-26435.herokuapp.com/ where it has been deployed on Heroku


## Dependencies

Ruby '2.3.5'
Rails Rails 5.1.6  
PostgreSQL 9.5.12  
Bootstrap
Jquery  
Stripe  
Cloudinary  
SendGrid

