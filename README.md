# GaExampleGem

[![Coverage Status](https://coveralls.io/repos/tibbon/ga-example-gem/badge.png)](https://coveralls.io/r/tibbon/ga-example-gem)

[![Build Status](https://travis-ci.org/tibbon/ga-example-gem.png?branch=master)](https://travis-ci.org/tibbon/ga-example-gem)

[![Code Climate](https://codeclimate.com/github/tibbon/ga-example-gem.png)](https://codeclimate.com/github/tibbon/ga-example-gem)

This Gem is just to demonstrate some patterns for creating, documenting and testing a Gem. 

## Installation

Add this line to your application's Gemfile:

    gem 'ga_example_gem'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ga_example_gem

## Usage

Setup a new instance: 

```ruby
client = GaExampleGem.configure do |config|
	config.api_key = "your_api_key"
end
```


Now make a request for an XKCD comic:

```ruby
	# Returns JSON of the first XKCD comic
	client.get_xkcd(1)
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
