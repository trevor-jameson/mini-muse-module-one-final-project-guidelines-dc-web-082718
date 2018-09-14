# Welcome to MINI MUSE!
The database analytics app for the top 500 albums of all time. MINI MUSE was developed as a proof of concept command line project by Brian H. Kang and Trevor S. Jameson for their Mod1 class at the Flatiron School. See the below steps to begin using the app.

## Mini Muse Setup
1. Create or update the database by running the command __rake import:all__
2. Start the app by running the command __ruby bin/run.rb__
3. Follow the prompts as they appear on the screen


### Project Requirements

1. Access a Sqlite3 Database using ActiveRecord.
2. You should have at minimum three models including one join model. This means you must have a many-to-many relationship.
3. You should seed your database using data that you collect either from a CSV, a website by scraping, or an API.
4. Your models should have methods that answer interesting questions about the data. For example, if you've collected info about movie reviews, what is the most popular movie? What movie has the most reviews?
5. You should provide a CLI to display the return values of your interesting methods.  
6. Use good OO design patterns. You should have separate classes for your models and CLI interface.

## Initial User Use Cases
### Implemented
- As a user, I want to find albums of a specific artist
- As a user, I want to find albums from a specific decade
- As a user, I want to search for all albums by an artist’s name
- As a user, I want to find the most popular album for a genre or subgenre
- As a developer, I want lots of command line gifs and memes in my app

### In Progress
- As a user, implement the above methods according to another user’s preferences of favorite artist, album, and genre
- As a user, I want to find all albums of a subgenre which includes the name of a genre
- As a user

## Instructor Instructions

1. Fork and clone this repository.
2. Build your application. Make sure to commit early and commit often. Commit messages should be meaningful (clearly describe what you're doing in the commit) and accurate (there should be nothing in the commit that doesn't match the description in the commit message). Good rule of thumb is to commit every 3-7 mins of actual coding time. Most of your commits should have under 15 lines of code and a 2 line commit is perfectly acceptable.
3. Make sure to create a good README.md with a short description, install instructions, a contributors guide and a link to the license for your code.
4. Make sure your project checks off each of the above requirements.
5. Prepare a video demo (narration helps!) describing how a user would interact with your working project.
    * The video should:
      - Have an overview of your project.(2 minutes max)
6. Prepare a presentation to follow your video.(3 minutes max)
    * Your presentation should:
      - Describe something you struggled to build, and show us how you ultimately implemented it in your code.
      - Discuss 3 things you learned in the process of working on this project.
      - Address, if anything, what you would change or add to what you have today?
      - Present any code you would like to highlight.   
7. *OPTIONAL, BUT RECOMMENDED*: Write a blog post about the project and process.

---
### Common Questions:
- How do I turn off my SQL logger?
```ruby
# in config/environment.rb add this line:
ActiveRecord::Base.logger = nil
```
