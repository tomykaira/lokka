# Lokka [<img src="https://secure.travis-ci.org/komagata/lokka.png"/>](http://travis-ci.org/komagata/lokka)

CMS written in Ruby for cloud computing.

## Features

* Performs in the cloud environment such as Google App Engine and Heroku as well as Windows, Mac, and Linux.
* Designed with reference to WordPress for WordPress users to easily understand.
* Easy installation
* Easy to create a theme for designers.
* A clear plug-in API for Rubyists

## Installation

    $ git clone git://github.com/komagata/lokka.git
    $ git submodule init
    $ git submodule update
    $ cd lokka
    $ bundle install --without=production:test
    $ bundle exec rake db:setup
    $ bundle exec rackup

View at: http://localhost:9292/

## How to use deck.js integration

[deck.js](https://github.com/imakewebthings/deck.js) is A jQuery library for modern HTML presentations.

With this lokka extension, you can write an article as a Kramdown (super set of markdown) document, then convert it to a slide without any operation.

What you have to do is add *p/* before the article page's URL.

For example:

    http://localhost:9292/1 -> http://localhost:9292/p/1

This supports only Kramdown now, entries written with other type are redirected to normal view.  This is because a Kramdown entry can be used as a presentation and a blog entry at the same time, and I prefer markdown :D


## Deploy to Heroku

    $ git clone git://github.com/komagata/lokka.git
    $ cd lokka
    $ heroku apps:create
    $ git push heroku master
    $ heroku rake db:setup
    $ heroku apps:open

## Test

    $ rake spec

## How to make a theme

Make a directory for theme in public/theme and you need to create entries.erb and entry.erb at least. (erb, haml and slim is available.)

### Index page

public/theme/example/entries.haml:

    !!! XML
    !!!
    %html
      %head
        %title Example
      %body
        %h1= @site.title
        - @entries.each do |entry|
          %h2= entry.title
          .body= entry.body

### Individual page

public/theme/example/entry.haml:

    !!! XML
    !!!
    %html
      %head
        %title Example
      %body
        %h1= @site.title
        %h2= @entry.title
        .body= @entry.body

## How to make a plugin

Lokka Plugin is subset of [Sinatra Extension](http://www.sinatrarb.com/extensions.html). but Lokka had a specific rules of nomenclature.
If you need display "Hello, World" when access to "/hello", Write a following.

public/plugin/lokka-hello/lib/lokka/hello.rb:

    module Lokka::Hello
      def self.registerd(app)
        app.get '/hello' do
          'hello'
        end
      end
    end

## Copyright

Copyright (c) 2010 Masaki Komagata. See LICENSE for details.
