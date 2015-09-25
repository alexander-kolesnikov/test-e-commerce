# README

Basic Rails e-commerce platform features functionality typically found in most e-commerce solutions. It allows users to view and order categorized products, while administrators possess privileges to create, update and delete products/categories and view orders.

 1. Required software
  Solution was developed and tested on 
  * Ruby 2.2.1p85
  * The platform uses [PostgreSQL](http://www.postgresql.org/) as main storage, installation instruction can be found [here](https://wiki.postgresql.org/wiki/Main_Page). 

 2. Setup
Clone the repository in a folder of your choice by running git clone command:
> $ git clone https://github.com/alexander-kolesnikov/test-e-commerce.git
  
  refile-mini_magick gem requires [ImageMagick](http://imagemagick.org/) (or [GraphicsMagick](http://www.graphicsmagick.org/)) to be installed, To install it simply run:
> \$ brew install imagemagick # OS X
> \$ sudo apt-get install imagemagick # Ubuntu
> \$ sudo yum install GraphicsMagick #Fedora/RedHat/CentOS

  Add user with CREATEDB permission in PostgreSQL to config/database.yml
> development:
>   <<: *default
>   database: test-e-commerce_development
> 
>   username: `<username>`

  cd into directory with the app. Run pending migrations and seed mock data by running the following > commands in the shell:
> \$ bundle
> \$ rake db:create db:migrate db:seed

 3. Basic functionality is tested with a suite of controller tests.
 Testing is performed by set of RSpec tests, which can be run with command
 > \$ rspec

