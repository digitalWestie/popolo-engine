# Popolo Rails Engine

*If you are looking for the GitHub repository for the data specification, head over to the [popolo-spec](https://github.com/opennorth/popolo-spec/tree/gh-pages) repository.*

[![Gem Version](https://badge.fury.io/rb/popolo-engine.svg)](http://badge.fury.io/rb/popolo-engine)
[![Build Status](https://secure.travis-ci.org/opennorth/popolo-engine.png)](http://travis-ci.org/opennorth/popolo-engine)
[![Dependency Status](https://gemnasium.com/opennorth/popolo-engine.png)](https://gemnasium.com/opennorth/popolo-engine)
[![Coverage Status](https://coveralls.io/repos/opennorth/popolo/badge.png?branch=master)](https://coveralls.io/r/opennorth/popolo)
[![Code Climate](https://codeclimate.com/github/opennorth/popolo-engine.png)](https://codeclimate.com/github/opennorth/popolo-engine)

Popolo's goal is to make it easier for civic developers to create government transparency, monitoring and engagement websites.

Popolo is a [Ruby on Rails engine](http://guides.rubyonrails.org/engines.html) that provides additional functionality to a [Ruby on Rails](http://rubyonrails.org/) application, so that developers can focus on what's special about the governments they want to monitor, instead of re-implementing features commonly found in open government websites. The core Popolo engine provides basic models, controllers and views for the objects found in all open government websites – people, organizations and the relationships between the two. Other engines provide additional functionality.

In addition to being a Rails engine, Popolo is also a [data specification](http://popoloproject.com/specs/). This engine is up-to-date with its 2014-02-10 version.

## Getting Started

Popolo uses Mongoid to connect to MongoDB, which requires Rails 3 and supports only MRI 1.9.3, 2.0.0 and HEAD, and JRuby 1.6.0+ in 1.9 mode.

First, create your Rails application:

    rails new myapp --skip-active-record

Add the `popolo` gem to your `Gemfile` and bundle your dependencies:

    gem 'popolo'
    bundle

If you didn't run `rails new` with the `--skip-active-record` option, follow Mongoid's [installation instructions](http://mongoid.org/en/mongoid/docs/installation.html). Otherwise:

    rails generate mongoid:config

Finally, run the `popolo` generator and create the MongoDB indexes:

    rails generate popolo
    bundle exec rake db:mongoid:create_indexes

If you would like to use the [free Lumen Bootstrap theme](http://bootswatch.com/lumen/), add the following line to your application's `application.css` file:

    *= require popolo

## Internationalization

If you are using Popolo's default views, you can translate your contact detail types and organization classifications by creating a locale file, e.g. `config/locales/en.yml`:

    en:
      popolo:
        contact_details:
          types:
            cell: Mobile number
        organizations:
          classifications:
            party:
              one: Political party
              other: Political parties

You may translate model names like:

    en:
      mongoid:
        models:
          popolo/membership:
            one: Membership
            other: Memberships

The `sources` property reuses the `Link` model. To translate this word:

    en:
      popolo:
        popolo/source:
          one: Source
          other: Sources

## Deployment

A Popolo app is easy to deploy on [Heroku](http://www.heroku.com/) using either the [MongoLab](https://addons.heroku.com/mongolab) or [MongoHQ](https://addons.heroku.com/mongohq) add-ons.

1. [Sign up for Heroku](http://api.heroku.com/signup) if you don't already have an account, and install the [Heroku Toolbelt](https://toolbelt.heroku.com/).

1. Create a new Cedar app on Heroku with either MongoLab or MongoHQ:

    ```sh
    heroku apps:create -s cedar --addons mongolab:starter
    # OR
    heroku apps:create -s cedar --addons mongohq:sandbox
    ```

1. If this is your first time using Heroku, read its guide, [Getting Started with Rails 3.x on Heroku](https://devcenter.heroku.com/articles/rails3), for next steps.

We highly recommend using the [Unicorn](http://unicorn.bogomips.org/) Rack HTTP server. [This blog post](http://blog.codeship.io/2012/05/06/Unicorn-on-Heroku.html) has great instructions. You can remove the `before_fork` and `after_fork` blocks from your `config/unicorn.rb` because [Mongoid will automatically reconnect after forks](http://mongoid.org/en/mongoid/docs/rails.html).

## Bugs? Questions?

This engine's main repository is on GitHub: [http://github.com/opennorth/popolo-engine](http://github.com/opennorth/popolo-engine), where your contributions, forks, bug reports, feature requests, and feedback are greatly welcomed.

## Acknowledgements

This gem is developed by [Open North](http://www.opennorth.ca/) through a partnership with the [Participatory Politics Foundation](http://www.participatorypolitics.org/).

Copyright (c) 2012 Open North Inc., released under the MIT license
