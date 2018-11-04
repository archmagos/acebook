# AceBook Engineering Project
[![Build Status](https://travis-ci.org/archmagos/acebook.svg?branch=master)](https://travis-ci.org/archmagos/acebook) [![Maintainability](https://api.codeclimate.com/v1/badges/04367eb735c458e093af/maintainability)](https://codeclimate.com/github/archmagos/acebook-nice-team/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/04367eb735c458e093af/test_coverage)](https://codeclimate.com/github/archmagos/acebook-nice-team/test_coverage)

**Acebook** is [now deployed to Heroku](http://acebook-frontend.herokuapp.com/).

Group engineering project, working in teams to produce a social media platform with a back-end hosted on **Rails** and a front-end managed by **Express** and **React**.

Our second, front-end repository [can be found here](https://github.com/archmagos/acebook-nice-team-frontend).

[Read our project log here.](https://hackmd.io/s/B1HxGw2Em#)

## Learning Objectives
* Understand the Rails MVC architecture.
* Implement features using a two-day sprint cycle.
* Record our learning process in HackMD.
* [Full learning objectives here.](https://github.com/makersacademy/course/blob/master/engineering_projects/rails/learning_objectives.md)

## Project outcomes
* Rails back-end successfully integrated with React front-end, with new posts dynamically rendered to the page.
* Other features built and fully-tested which do not yet exist in the front-end include:
    * User can sign-up
    * User can log-in / log-out
    * User can add comments to posts
    * User can like posts & delete their likes from posts
* Migrated our entire project front-end over to a new technology within three days.
* Travis CI checks pass with 100% code coverage.
* App [deployed to Heroku](http://acebook-frontend.herokuapp.com/).

## Implementation

Clone this repo, then:

```bash
> bundle install
> bin/rails db:create
> bin/rails db:migrate

> bundle exec rspec # Run the tests to ensure it works
> bin/rails server # Start the server at localhost:3000. N.B. Front-end server must be running on port 4000 for browser access!
```
## Contributors
* [Ben Luke Smith-Gordon](https://github.com/Ben-893)
* [Fred H](https://github.com/archmagos)
* [John Forster](https://github.com/JohnForster)
* [Layth Al-Qattan](https://github.com/laythq)
* [Yvonne Tang](https://github.com/YvCodeHong)
