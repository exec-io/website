Application Name Overview
==============================================

This is the exec.io website found at http://exec.io/


Required Environment / Minimum Setup
----------------------------------------------

* Ruby version 2.1.0
* PostgreSQL database

Basic setup involves:

    $ git clone git@github.com:exec-io/website.git
    $ rake db:setup
    $ rake db:seed
    $ rails s

Should get you running.


Notable Deviations
----------------------------------------------

This website is a multilingual website that is backed by localeapp.

The exec.io website only uses the PostgreSQL database for local storage of blog
posts at this point.  All blog posts are actually stored in the translation files
and are updated via localeapp.  This allows for multiple translators to work
on the website translations at once.


Accessing the Site
----------------------------------------------

Site is a simple rails app responding on one domain name, exec.io.

It does have multiple languages though.  You access these by adding the locale
to the start of the path, for example, http://exec.io/de will give you the root
page in German.


Configuration
----------------------------------------------

The app is hosted on Heroku.


Walkthrough / Smoke Test
----------------------------------------------

You should be able to visit each page.  You can also access the admin screen via
the /admin path.  This uses ActiveAdmin.


Testing
----------------------------------------------

    $ rake spec

Runs all of the specs.


Staging Environment
----------------------------------------------

No staging environment at this time.


Production Environment
----------------------------------------------

Production is on Heroku.  Release via:

    $ git push heroku master:master

