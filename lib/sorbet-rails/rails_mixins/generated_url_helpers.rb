# typed: ignore

# Sorbet does not allow dynamic includes like `url_helpers`
# This module is a drop-in replacement for the dynamic include, and should
# contains all _url, _path methods as defined in the URL helpers.
#
# eg:
#
# class MyClass
# - include Rails.application.routes.url_helpers
# + include GeneratedUrlHelpers
# end
#
module GeneratedUrlHelpers
  include Rails.application.routes.url_helpers
end
