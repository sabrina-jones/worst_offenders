# WorstOffenders

This Ruby Gem provides a CLI to view the Top 3 Worst Offenders of providing overly positive reviews for McKaig Chevrolet Buick. "Overly positive" endorsments are defined as having been among the most recent reviews on the first 5 pages of the website, they must contain the phrase "Best car buying experience" in the heading of their review and they are ranked as most severe to least severe by user as those users with usernames earlier in the alphabet are higher offender of being overly positive. A review has a heading, user, and content.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'worst_offenders'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install worst_offenders

## Usage

run ./bin/worst-offenders

The user will be welcomed to the CLI and asked what they would like to do:
Welcome to the CLI - Worst offenders for overly positive reviews - McKaig Chevrolet Buick

Would you like to view the Top 3 offenders of submitting overly positive reviews (y to view top 3/n to view list criteria/ exit to quit) ?

Ex. if the user inputs "y" a list of the top 3 reviews will appear.

Ex. if the user inputs "n" a list of the criteria from being on the list will appear.

Ex. if the user inputs "exit" will exit the cli.


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/'sabrina-jones'/worst_offenders. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the WorstOffenders project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/'sabrina-jones'/worst_offenders/blob/master/CODE_OF_CONDUCT.md).
