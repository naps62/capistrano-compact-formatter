# Capistrano Compact Formatter

Custom formatter for Capistrano 3, with compact output, and opinionated according to my own needs.

I don't like the built-in formatters from sshkit. They're too verbose in debug mode, but too little verbose otherwise. Everytime an error occurred while using `set :debug, :info`, I would find myself changing it back to `:debug` to see the actual error messages.

A quick breakdown of what it does:

* no difference for each log level. I might add this in the future, but at this point, I didn't feel the need;
* each command is printed in a single line, containing a trimmed message and a success flag;
* if a command has output in stdout/stderr, it will be printed below, with a leading tab, in green/red respectively;
* conditional commands (i.e. commands with the format `[ some_bash_condition ]`) will not be printed. They return frequently return false, which would output a red failure flag. I find that misleading, since it doesn't mean the deploy failed. It's merely a condition that evaluated to false.

Sample output:

![Sample Output](sample-output.png)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'capistrano-compact-formatter'
```

Or install it yourself as:

    $ gem install capistrano-compact-formatter

## Usage

And require it in your `Capfile`

```ruby
# Capfile

require 'capistrano-compact-formatter'
```

Then in your `config/deploy.rb`, specify the formatter to use:

```ruby
# config/deploy.rb

set :format, :compact
```

And you're all set!

## Contributing

1. Fork it ( https://github.com/[my-github-username]/capistrano-compact-formatter/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
