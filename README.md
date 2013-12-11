# Plinth

## VERSION 2, Donetsk

TODO: Write a gem description

## Development Workflow

Clone the repository:

    git clone https://github.com/thebeansgroup/plinth.git

Checkout the develop branch

    git checkout develop

Create a new branch for the feature you want to work on:

    git checkout -b feature/[name-of-feature]

To run the site, use the foreman:

    bundle install
    foreman start

**NB: ** Ensure that you are _adding_ and _committing_ files into your branch as you go along. It is also good practive to _push_ the branch to github at the end of your development session, this enusres global access to the markup you have changed.

## Installation

Add this line to your application's Gemfile:

    gem 'plinth'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install plinth

## Usage

### Javascript
All javascripts provided by plinth can be pulled into the asset pipeline
with the normal require command:

    //= require test

### Stylesheets
All stylesheets provided by plinth can be pulled into the asset pipeline
with the normal require command:

    //= require test

### Views/Partials
In order to include partials defined by plinth  you will have to add the
styleguid's view path to your apps view path. The quickest way is by creating
a before filter in either the action where you want the views to be accessible
or, if you will be using the views often, you can define the filter in the
application controller.

    before_filter :plinth_view_path

    private
    def plinth_view_path
      gem = Gem.loaded_specs['plinth']
      if gem
        prepend_view_path "#{gem.full_gem_path}/vendor/assets/views"
      end
    end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature develop`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request, make sure your pull request target is the develop branch, not the master
