# Maistro

```ruby
# basic DSL
maistro = Maistro.new
maistro.add_agent Maistro::Agent.new(role: 'You are in charge of writing requirements for product decision', prompt: '...')
maistro.add_agent Maistro::Agent.new(role: 'You are in charge of writing code', prompt: '...')
maistro.add_agent Maistro::Agent.new(role: 'You are in charge of writing specs for code', prompt: '...')
maistro.add_agent Maistro::Agent.new(role: 'You are in charge of publishing code to Github', prompt: '...')
thread = maistro.start('Write a snake app in typescript')
while thread.ongoing?
  if thread.input_needed?
    puts thread.last_message
    thread.respond(user_input) # gather input somehow
  end
  sleep 1
end

# extended DSL for agent
class PushCode < Maistro::Agent
  
  ARGUMENTS = {
    directory: {
      required: true,
      type: :string
    }
  }

  def execute!
    puts "do something #{arguments}"
  end

end
Maistro::Agent.new(
    role: 'You are in charge of publishing code to Github', 
    prompt: 'When the code is ready for delivery you are in charge of coming up with a name for the repository, creating the repo, initializing git and pushing a new branch',
    functions: {
        pushCode: PushCode,
        ...
    })
```


## Installation

TODO: Replace `UPDATE_WITH_YOUR_GEM_NAME_IMMEDIATELY_AFTER_RELEASE_TO_RUBYGEMS_ORG` with your gem name right after releasing it to RubyGems.org. Please do not do it earlier due to security reasons. Alternatively, replace this section with instructions to install your gem from git if you don't plan to release to RubyGems.org.

Install the gem and add to the application's Gemfile by executing:

    $ bundle add UPDATE_WITH_YOUR_GEM_NAME_IMMEDIATELY_AFTER_RELEASE_TO_RUBYGEMS_ORG

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install UPDATE_WITH_YOUR_GEM_NAME_IMMEDIATELY_AFTER_RELEASE_TO_RUBYGEMS_ORG

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/maistro. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/maistro/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Maistro project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/maistro/blob/master/CODE_OF_CONDUCT.md).
