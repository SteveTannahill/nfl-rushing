# README

# theScore "the Rush" Interview Challenge
At theScore, we are always looking for intelligent, resourceful, full-stack developers to join our growing team. To help us evaluate new talent, we have created this take-home interview question. This question should take you no more than a few hours.

**All candidates must complete this before the possibility of an in-person interview. During the in-person interview, your submitted project will be used as the base for further extensions.**

### Why a take-home challenge?
In-person coding interviews can be stressful and can hide some people's full potential. A take-home gives you a chance work in a less stressful environment and showcase your talent.

We want you to be at your best and most comfortable.

### A bit about our tech stack
As outlined in our job description, you will come across technologies which include a server-side web framework (like Elixir/Phoenix, Ruby on Rails or a modern Javascript framework) and a front-end Javascript framework (like ReactJS)

### Challenge Background
We have sets of records representing football players' rushing statistics. All records have the following attributes:
* `Player` (Player's name)
* `Team` (Player's team abbreviation)
* `Pos` (Player's postion)
* `Att/G` (Rushing Attempts Per Game Average)
* `Att` (Rushing Attempts)
* `Yds` (Total Rushing Yards)
* `Avg` (Rushing Average Yards Per Attempt)
* `Yds/G` (Rushing Yards Per Game)
* `TD` (Total Rushing Touchdowns)
* `Lng` (Longest Rush -- a `T` represents a touchdown occurred)
* `1st` (Rushing First Downs)
* `1st%` (Rushing First Down Percentage)
* `20+` (Rushing 20+ Yards Each)
* `40+` (Rushing 40+ Yards Each)
* `FUM` (Rushing Fumbles)

In this repo is a sample data file [`rushing.json`](/rushing.json).

##### Challenge Requirements
1. Create a web app. This must be able to do the following steps
    1. Create a webpage which displays a table with the contents of [`rushing.json`](/rushing.json)
    2. The user should be able to sort the players by _Total Rushing Yards_, _Longest Rush_ and _Total Rushing Touchdowns_
    3. The user should be able to filter by the player's name
    4. The user should be able to download the sorted data as a CSV, as well as a filtered subset
    
2. The system should be able to potentially support larger sets of data on the order of 10k records.

3. Update the section `Installation and running this solution` in the README file explaining how to run your code

### Submitting a solution
1. Download this repo
2. Complete the problem outlined in the `Requirements` section
3. In your personal public GitHub repo, create a new public repo with this implementation
4. Provide this link to your contact at theScore

We will evaluate you on your ability to solve the problem defined in the requirements section as well as your choice of frameworks, and general coding style.

### Help
If you have any questions regarding requirements, do not hesitate to email your contact at theScore for clarification.

### Installation and running this solution

## Stack with Versions

This app is built with Ruby on Rails with a Postgresql Database.

Rails Version = Rails 6.0.4

Ruby Version = ruby 2.7.0p0 (2019-12-25 revision 647ee6f091) [x86_64-linux]


## Installation

Install ruby on rails using ther versions above. 
This guide will help https://guides.rubyonrails.org/getting_started.html

Install postgress. Guide: https://www.codementor.io/@engineerapart/getting-started-with-postgresql-on-mac-osx-are8jcopb

I used paiza.cloud to set up a cloud based environment.

Download this repo.

##Running and Testing the App

1. Config and seed DB
  $ rake db:create
  $ rake db:migrate
  $ rake db:seed 

  The seed rake will ingest the running.json file into the database.  
  You can add a "seed_count" env variable to choose the number of records you 
  would like to ingest.
  
  Example:
  
  $ rake db:seed seed_count=1000 
  
  This will seed the db with at least 1000 records by ingesting the rushing.json file
  repeatedly until the count of records is greater the seed_count.
  
2. Starting the app server 
  $ rails s

  Once started you can navigate to http://localhost:3000/ to see the app.
  
3. App Testing 
  $ rails test

  To review the tests I wrote for this challenge you can review these files:
  - nfl-rushing/test/helpers/players_helper_test.rb
  - nfl-rushing/test/controllers/players_controller_test.rb
  
##Challenge Requirments 

1.1 Seed the db with a single set of the rushing.json data.  Go to http://localhost:3000/. 
    The rushing.json data should be visible in a table.

1.2 Use the "Sort by" and the "Order" fields to choose which column to sort and the direction.
    Click the "Update" button to sort the table.

1.3 Us the "Select player" field to choose the players name.  Click "Select" to filter the table.

1.4 Click on the "Download as CSV" at any point to download the current sorted or filtered table
    as a csv.
    
2 Use

  $ rake db:seed seed_count=10000
  
  to load the db with 10k and then run any of the examples above.
  
