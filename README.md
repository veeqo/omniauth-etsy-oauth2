# OmniAuth Etsy

Etsy OAuth2 Strategy for OmniAuth 1.0.

<a href="https://www.veeqo.com/" title="Sponsored by Veeqo">
    <img src="https://static.veeqo.com/assets/sponsored_by_veeqo.png" width="200" />
</a>

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-etsy-oauth2'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install omniauth-etsy-oauth2

## Usage

`OmniAuth::Strategies::Etsy` is simply a Rack middleware. Read [the OmniAuth 1.0 docs](https://github.com/intridea/omniauth) for detailed instructions.

Here's a quick example, adding the middleware to a Rails app in `config/initializers/etsy.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :etsy,
           ENV['ETSY_API_KEY'],
           ENV['ETSY_API_SECRET'],
           response_type: 'code',
           callback_path: '/auth/etsy/callback',
           scope: %w[listings_r listings_w transactions_r transactions_w email_r address_r billing_r]
end
```

* `scope`: A space-separated list of permissions you want to request from the user. See [the Etsy Open API docs](https://developers.etsy.com/documentation/essentials/authentication/#scopes) for a full list of available permissions.

Authenticate users by having them visit `/auth/etsy` with additional query parameters - `/auth/etsy?user_id=local_user_id`

## Authentication Hash

Here's an example *Authentication Hash* available in `request.env['omniauth.auth']`:

```ruby
{
  provider: :etsy,
  credentials: {
    token: 'access_token',
    refresh_token: 'refresh_token',
    expires_at: 1627977818,
    expires: true,
    expires_in: 3600,
    user_id: 'user_id'
  }
}
```

Your additional params available in `request.env['omniauth.params']`:
```ruby
{
  "user_id"=>"local_user_id"
}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/veeqo/omniauth-etsy-oauth2. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/veeqo/omniauth-etsy-oauth2/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the omniauth-etsy-oauth2 project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/veeqo/omniauth-etsy-oauth2/blob/master/CODE_OF_CONDUCT.md).
