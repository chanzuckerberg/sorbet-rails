# Contributing to Sorbet Rails

Thank you for taking the time to contribute to this project!

This project adheres to the Contributor Covenant
[code of conduct](https://github.com/chanzuckerberg/.github/tree/master/CODE_OF_CONDUCT.md).
By participating, you are expected to uphold this code. Please report unacceptable behavior
to opensource@chanzuckerberg.com.

This project is licensed under the [MIT license](LICENSE.md).

## Need Help?

If you are trying to integrate Sorbet into your project, consider these venues:

 * **Stack Overflow**: Try the [sorbet](https://stackoverflow.com/questions/tagged/sorbet)
   and [sorbet + ruby-on-rails](https://stackoverflow.com/questions/tagged/sorbet+ruby-on-rails) tags
 * **Slack**: [the Sorbet community](https://sorbet.org/en/community) includes
   [#discuss](https://sorbet-ruby.slack.com/app_redirect?channel=discuss) and
   [#rails](https://sorbet-ruby.slack.com/app_redirect?channel=rails) channels

If you've come here to report an issue, you're in the right place!

## Reporting Bugs and Adding Functionality

We're excited you'd like to contribute to Sorbet Rails!

When reporting a bug, please include:
 * Steps to reproduce
 * The versions of Ruby, Ruby on Rails, Sorbet, and this gem that you are using
 * A test case, if you are able

**If you believe you have found a security issue, please contact us at security@chanzuckerberg.com**
rather than filing an issue here.

When proposing new functionality, please include test coverage. We're also available in
the Sorbet Slack [#rails](https://sorbet-ruby.slack.com/app_redirect?channel=rails) channel
to discuss your idea before you get started, just to make sure everyone is on the same page.

## Local Development

1. Clone `sorbet-rails` locally:

```sh
❯ git clone https://github.com/chanzuckerberg/sorbet-rails.git
```

2. Point your project's Gemfile to your local clone:

```
# -- Gemfile --

gem 'sorbet-rails', path: "~/sorbet-rails"
```

The most important files are:

 * [`rbi/activerecord.rbi`](rbi/activerecord.rbi): The ActiveRecord RBI.
   If you change anything in this file, it will be reflected when you run `srb tc`.

 * [`lib/sorbet-rails/model_rbi_formatter.rb`](lib/sorbet-rails/model_rbi_formatter.rb):
   Generates RBI files for models. You can regenerate these using `bundle exec rake rails_rbi:models`.

 * [`lib/sorbet-rails/routes_rbi_formatter.rb`](lib/sorbet-rails/routes_rbi_formatter.rb):
   Generates an RBI files for routes.  You can regenerate these using `bundle exec rake rails_rbi:routes`.

## Tests

Tests are written using [RSpec](https://rspec.info/). Each pull request is run against
multiple versions of both Ruby and Ruby on Rails. A code coverage report is also generated.

You can run tests using `bundle exec rake`.

By default, tests will run against a Rails 5.2.3 test application.

To run the tests against all supported Rails branches, use:

```sh
❯ ./spec/bin/run_all_specs.sh
```

You can also switch to a version of Rails with `RAILS_VERSION`:

```sh
❯ RAILS_VERSION=4.2 ./spec/bin/run_spec.sh
❯ RAILS_VERSION=5.1 ./spec/bin/run_spec.sh
❯ RAILS_VERSION=5.2 ./spec/bin/run_spec.sh
```

### Writing Tests

Tests are in the `_spec.rb` files in the [`spec/`](spec/) directory.

Rails apps are stored in [`spec/support/`](spec/support/). Code shared across Rails versions
(models, views, controllers) are in [`spec/support/rails_shared/`](spec/support/rails_shared/)
and symlinked to the individual Rails apps.

To update the routes, see
[`rails_shared/config/routes.rb`](spec/support/rails_shared/config/routes.rb)
and [`rails_shared/app/controller/`](spec/support/rails_shared/app/controller/).

To update the models, see [`rails_shared/app/models/`](spec/support/rails_shared/app/models/).
Add database migrations to [`rails_shared/db/migrate/`](spec/support/rails_shared/db/migrate/)
and remember to run `bundle exec rake db:migrate` in each application directory.

#### Expected Output

If your new tests make changes to the expected output, you can update the expected output
by running:

```sh
❯ ./spec/bin/update_test_data.sh
```

Only do this once you're confident that your code is correct, because it will update
the expected test data stored in [`spec/test_data/`](spec/test_data/) based on your current
code, and all tests will then pass.
