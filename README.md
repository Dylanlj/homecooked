# README

Rails recommendations:
* Ruby version
* System dependencies
* Configuration
* Database creation
* Database initialization
* How to run the test suite
* Services (job queues, cache servers, search engines, etc.)
* Deployment instructions
* ...

## Summary

Project name: Homecooked

Project description: Web app that allows users to set up a small food sharing or selling business.
They can either sell extra food they're making at a specific time, or set up a time window for drop-ins or online orders.
Will integrate google maps to display nearby locations to potential customers on their smartphones.

## Ideation Session
- About the product, not the business, so don't worry about licensing probably!

- Use info about food in a way that creates a different user experience
- Most explosive growth in media about food is the 30 second video.

- Make the production of good media and data a part of the project experience.
- Also consider not just images; possibly also gifs/videos of the food being shared!
- The deliverable is the demo!

- Check in with mentors every day! Talk about what you did, any roadblocks, make sure you communicate.

- Try to iterate quickly. May be good to ask other users, how they would use your app, to get another view on how your app would work.

## Pushing to development branch, updating master

When pushing to a non-default branch, you need to specify the source ref (branch1) and the target ref (branch2):

git push origin branch1:branch2

To merge with master, first pull latest updates from development branch. This will be added to a local development branch.

git pull origin master:development

Then merge with your local master, and push to master.