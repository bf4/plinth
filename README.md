# Sb::Styleguide

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'sb-styleguide'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sb-styleguide

## Usage

### Javascript
All javascripts provided by this styleguide can be pulled into the asset pipeline
with the normal require command:

`//= require test`

### Stylesheets
All stylesheets provided by this styleguide can be pulled into the asset pipeline
with the normal require command:

`//= require test`

### Views/Partials
In order to include partials defined by the styleguide you will have to add the
styleguid's view path to your apps view path. The quickest way is by creating
a before filter in either the action where you want the views to be accessible
or, if you will be using the views often, you can define the filter in the
application controller.

`
before_filter :styleguide_view_path

private
def styleguide_view_path
  gem = Gem.loaded_specs['sb-styleguide']
  if gem
    prepend_view_path "#{gem.full_gem_path}/vendor/assets/views"
  end
end
`

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
