# Multiio

Delegates to Multiple IO sources (e.g. STDOUT, File)

Inspired by this answer on stackoverflow:
https://stackoverflow.com/a/20422708/3384609

>Also, if you want colors, STDOUT or STDERR must be put last, since it's the only two where colors are supposed to be output. But then, it will also output colors to your file.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'multiio'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install multiio

## Usage

```ruby

default_log_location = File.absolute_path(File.join(
  File.dirname(__FILE__), "..", "log", "vr2-worker-driver.log")
)
log_file_location = ENV['LOG_FILE_LOCATION']
if log_file_location == nil
  FileUtils.mkdir_p File.dirname(default_log_location)
  log_file_location = default_log_location
end
file = File.open(log_file_location, 'w')
@logger = Logger.new(MultiIO.new(file, STDOUT), 'daily')

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/multiio.
