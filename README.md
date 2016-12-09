# Foggy

Paperclip storage that abstracts fog assets into local temporary files regardless of where it is remotely stored.

This gem is likely more useful in migration scenarios where you need to move away from a file system storage over to a remote one and there are loads of references to `asset.path` that rely on that path being local in the file system.

**Note** this is an experimental project at this point and not all edge cases have been considered.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'paperclip-foggy'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install paperclip-foggy

## Usage

You may simply use `foggy` as you would use `fog`, it essentially wraps [Paperclip::Storage::Fog]() in order to provide the local file abstraction.

```
class User < ActiveRecord::Base
  include Paperclip::Glue

  has_attached_file :avatar, {
    storage: :foggy,
    url: ':class/:id/:attachment/:style/:filename',
    path: ':class/:id/:attachment/:style/:filename',
  }
end
```

Avatar in the code above is stored remotely by `Fog` under the hoods, though, `user.avatar.path` will download the corresponding asset from its remote location and store it locally in a temp file so it may be manipulated as needed.


```
url = user.avatar.url
=> https://s3-hq.powerhrg.com/nitro-devbox/users/1/avatars/original/avatar.jpg?AWSAccessKeyId=GWNQSVNDSVYEMTU6EFPD&Signature=WZQIaey%2Ba8pgMGrzwYIz1aNGri8%3D&Expires=1480768274

file = user.avatar.path
=> /var/folders/p_/hl_4_rfj7cd1mslzvgscnp4r0000gn/T/dd8fc45d87f91c6f9a9f43a3f355a94a20161209-36036-uvaeug.jpg
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/paperclip-foggy. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
