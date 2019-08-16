# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: strong
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/bindex/all/bindex.rbi
#
# bindex-0.8.1
module Skiptrace
  def self.current_bindings; end
end
class Exception
  def binding_locations; end
  def bindings; end
end
class Skiptrace::Location
  def absolute_path; end
  def base_label; end
  def binding; end
  def initialize(location, binding); end
  def inspect; end
  def label; end
  def lineno; end
  def to_s; end
end
class Skiptrace::BindingLocations < BasicObject
  def cached_location(location); end
  def guess_binding_around(location); end
  def initialize(locations, bindings); end
  def method_missing(name, *args, &block); end
  def respond_to_missing?(name, include_all = nil); end
end
class Binding
end
