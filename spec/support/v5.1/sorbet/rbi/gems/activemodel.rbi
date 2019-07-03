# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: true
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/activemodel/all/activemodel.rbi
#
# activemodel-5.1.7
module ActiveModel
  def self.eager_load!; end
  def self.gem_version; end
  def self.version; end
  extend ActiveSupport::Autoload
end
module ActiveModel::VERSION
end
module ActiveModel::Serializers
  extend ActiveSupport::Autoload
end
class ActiveModel::Railtie < Rails::Railtie
end
class ActiveModel::MissingAttributeError < NoMethodError
end
module ActiveModel::AttributeMethods
  def attribute_method?(attr_name); end
  def attribute_missing(match, *args, &block); end
  def matched_attribute_method(method_name); end
  def method_missing(method, *args, &block); end
  def missing_attribute(attr_name, stack); end
  def respond_to?(method, include_private_methods = nil); end
  def respond_to_without_attributes?(*arg0); end
  extend ActiveSupport::Concern
end
module ActiveModel::AttributeMethods::ClassMethods
  def alias_attribute(new_name, old_name); end
  def attribute_alias(name); end
  def attribute_alias?(new_name); end
  def attribute_method_affix(*affixes); end
  def attribute_method_matchers_cache; end
  def attribute_method_matchers_matching(method_name); end
  def attribute_method_prefix(*prefixes); end
  def attribute_method_suffix(*suffixes); end
  def define_attribute_method(attr_name); end
  def define_attribute_methods(*attr_names); end
  def define_proxy_call(include_private, mod, name, send, *extra); end
  def generated_attribute_methods; end
  def instance_method_already_implemented?(method_name); end
  def undefine_attribute_methods; end
end
class ActiveModel::AttributeMethods::ClassMethods::AttributeMethodMatcher
  def initialize(options = nil); end
  def match(method_name); end
  def method_missing_target; end
  def method_name(attr_name); end
  def plain?; end
  def prefix; end
  def suffix; end
end
class ActiveModel::AttributeMethods::ClassMethods::AttributeMethodMatcher::AttributeMethodMatch < Struct
  def attr_name; end
  def attr_name=(_); end
  def method_name; end
  def method_name=(_); end
  def self.[](*arg0); end
  def self.inspect; end
  def self.members; end
  def self.new(*arg0); end
  def target; end
  def target=(_); end
end
module ActiveModel::Type
  def self.lookup(*args, **kwargs); end
  def self.register(type_name, klass = nil, **options, &block); end
  def self.registry; end
  def self.registry=(arg0); end
end
module ActiveModel::Type::Helpers
end
class ActiveModel::Type::Helpers::AcceptsMultiparameterTime < Module
  def initialize(defaults: nil); end
end
module ActiveModel::Type::Helpers::Numeric
  def cast(value); end
  def changed?(old_value, _new_value, new_value_before_type_cast); end
  def non_numeric_string?(value); end
  def number_to_non_number?(old_value, new_value_before_type_cast); end
end
module ActiveModel::Type::Helpers::Mutable
  def cast(value); end
  def changed_in_place?(raw_old_value, new_value); end
end
module ActiveModel::Type::Helpers::TimeValue
  def apply_seconds_precision(value); end
  def default_timezone; end
  def fast_string_to_time(string); end
  def is_utc?; end
  def new_time(year, mon, mday, hour, min, sec, microsec, offset = nil); end
  def serialize(value); end
  def type_cast_for_schema(value); end
  def user_input_in_time_zone(value); end
end
class ActiveModel::Type::Value
  def ==(other); end
  def assert_valid_value(*arg0); end
  def binary?; end
  def cast(value); end
  def cast_value(value); end
  def changed?(old_value, new_value, _new_value_before_type_cast); end
  def changed_in_place?(raw_old_value, new_value); end
  def deserialize(value); end
  def eql?(other); end
  def force_equality?(_value); end
  def hash; end
  def initialize(precision: nil, limit: nil, scale: nil); end
  def limit; end
  def map(value); end
  def precision; end
  def scale; end
  def serialize(value); end
  def type; end
  def type_cast_for_schema(value); end
end
class ActiveModel::Type::Integer < ActiveModel::Type::Value
  def _limit; end
  def cast_value(value); end
  def deserialize(value); end
  def ensure_in_range(value); end
  def initialize(*arg0); end
  def max_value; end
  def min_value; end
  def range; end
  def serialize(value); end
  def type; end
  include ActiveModel::Type::Helpers::Numeric
end
class ActiveModel::Type::BigInteger < ActiveModel::Type::Integer
  def max_value; end
end
class ActiveModel::Type::Binary < ActiveModel::Type::Value
  def binary?; end
  def cast(value); end
  def changed_in_place?(raw_old_value, value); end
  def serialize(value); end
  def type; end
end
class ActiveModel::Type::Binary::Data
  def ==(other); end
  def hex; end
  def initialize(value); end
  def to_s; end
  def to_str; end
end
class ActiveModel::Type::Boolean < ActiveModel::Type::Value
  def cast_value(value); end
  def type; end
end
class ActiveModel::Type::Date < ActiveModel::Type::Value
  def cast_value(value); end
  def fallback_string_to_date(string); end
  def fast_string_to_date(string); end
  def new_date(year, mon, mday); end
  def serialize(value); end
  def type; end
  def type_cast_for_schema(value); end
  def value_from_multiparameter_assignment(*arg0); end
  include Anonymous_ActiveModel_Type_Helpers_AcceptsMultiparameterTime_5
end
module Anonymous_ActiveModel_Type_Helpers_AcceptsMultiparameterTime_5
  def assert_valid_value(value); end
  def cast(value); end
  def value_from_multiparameter_assignment(values_hash); end
end
class ActiveModel::Type::DateTime < ActiveModel::Type::Value
  def cast_value(value); end
  def fallback_string_to_time(string); end
  def microseconds(time); end
  def type; end
  def value_from_multiparameter_assignment(values_hash); end
  include ActiveModel::Type::Helpers::TimeValue
  include Anonymous_ActiveModel_Type_Helpers_AcceptsMultiparameterTime_6
end
module Anonymous_ActiveModel_Type_Helpers_AcceptsMultiparameterTime_6
  def assert_valid_value(value); end
  def cast(value); end
  def value_from_multiparameter_assignment(values_hash); end
end
class ActiveModel::Type::Decimal < ActiveModel::Type::Value
  def apply_scale(value); end
  def cast_value(value); end
  def convert_float_to_big_decimal(value); end
  def float_precision; end
  def type; end
  def type_cast_for_schema(value); end
  include ActiveModel::Type::Helpers::Numeric
end
class ActiveModel::Type::Float < ActiveModel::Type::Value
  def cast_value(value); end
  def serialize(value); end
  def type; end
  def type_cast_for_schema(value); end
  include ActiveModel::Type::Helpers::Numeric
end
class ActiveModel::Type::ImmutableString < ActiveModel::Type::Value
  def cast_value(value); end
  def serialize(value); end
  def type; end
end
class ActiveModel::Type::String < ActiveModel::Type::ImmutableString
  def cast_value(value); end
  def changed_in_place?(raw_old_value, new_value); end
end
class ActiveModel::Type::Time < ActiveModel::Type::Value
  def cast_value(value); end
  def type; end
  def user_input_in_time_zone(value); end
  include ActiveModel::Type::Helpers::TimeValue
  include Anonymous_ActiveModel_Type_Helpers_AcceptsMultiparameterTime_7
end
module Anonymous_ActiveModel_Type_Helpers_AcceptsMultiparameterTime_7
  def assert_valid_value(value); end
  def cast(value); end
  def value_from_multiparameter_assignment(values_hash); end
end
class ActiveModel::Type::Registry
  def find_registration(symbol, *args); end
  def initialize; end
  def lookup(symbol, *args); end
  def register(type_name, klass = nil, **options, &block); end
  def registration_klass; end
  def registrations; end
end
class ActiveModel::Type::Registration
  def block; end
  def call(_registry, *args, **kwargs); end
  def initialize(name, block, **arg2); end
  def matches?(type_name, *args, **kwargs); end
  def name; end
end
class ActiveModel::Errors
  def [](attribute); end
  def add(attribute, message = nil, options = nil); end
  def added?(attribute, message = nil, options = nil); end
  def apply_default_array(hash); end
  def as_json(options = nil); end
  def blank?; end
  def clear; end
  def copy!(other); end
  def count; end
  def delete(key); end
  def details; end
  def each; end
  def empty?; end
  def full_message(attribute, message); end
  def full_messages; end
  def full_messages_for(attribute); end
  def generate_message(attribute, type = nil, options = nil); end
  def has_key?(attribute); end
  def include?(attribute); end
  def init_with(coder); end
  def initialize(base); end
  def initialize_dup(other); end
  def key?(attribute); end
  def keys; end
  def marshal_dump; end
  def marshal_load(array); end
  def messages; end
  def normalize_detail(message, options); end
  def normalize_message(attribute, message, options); end
  def size; end
  def to_a; end
  def to_hash(full_messages = nil); end
  def to_xml(options = nil); end
  def values; end
  def without_default_proc(hash); end
  include Enumerable
end
class ActiveModel::StrictValidationFailed < StandardError
end
class ActiveModel::RangeError < RangeError
end
class ActiveModel::UnknownAttributeError < NoMethodError
  def attribute; end
  def initialize(record, attribute); end
  def record; end
end
module ActiveModel::SecurePassword
  def self.min_cost; end
  def self.min_cost=(arg0); end
  extend ActiveSupport::Concern
end
module ActiveModel::SecurePassword::ClassMethods
  def has_secure_password(options = nil); end
end
module ActiveModel::SecurePassword::InstanceMethodsOnActivation
  def authenticate(unencrypted_password); end
  def password; end
  def password=(unencrypted_password); end
  def password_confirmation=(unencrypted_password); end
end
module ActiveModel::Callbacks
  def _define_after_model_callback(klass, callback); end
  def _define_around_model_callback(klass, callback); end
  def _define_before_model_callback(klass, callback); end
  def define_model_callbacks(*callbacks); end
  def self.extended(base); end
end
class ActiveModel::Name
  def !~(*args, &block); end
  def <=>(*args, &block); end
  def ==(arg); end
  def ===(arg); end
  def =~(*args, &block); end
  def _singularize(string); end
  def as_json(*args, &block); end
  def cache_key; end
  def collection; end
  def element; end
  def eql?(*args, &block); end
  def human(options = nil); end
  def i18n_key; end
  def initialize(klass, namespace = nil, name = nil); end
  def name; end
  def param_key; end
  def plural; end
  def route_key; end
  def singular; end
  def singular_route_key; end
  def to_s(*args, &block); end
  def to_str(*args, &block); end
  include Comparable
end
module ActiveModel::Naming
  def model_name; end
  def self.extended(base); end
  def self.model_name_from_record_or_class(record_or_class); end
  def self.param_key(record_or_class); end
  def self.plural(record_or_class); end
  def self.route_key(record_or_class); end
  def self.singular(record_or_class); end
  def self.singular_route_key(record_or_class); end
  def self.uncountable?(record_or_class); end
end
module ActiveModel::Translation
  def human_attribute_name(attribute, options = nil); end
  def i18n_scope; end
  def lookup_ancestors; end
  include ActiveModel::Naming
end
class ActiveModel::ForbiddenAttributesError < StandardError
end
module ActiveModel::ForbiddenAttributesProtection
  def sanitize_for_mass_assignment(attributes); end
  def sanitize_forbidden_attributes(attributes); end
end
module ActiveModel::AttributeAssignment
  def _assign_attribute(k, v); end
  def _assign_attributes(attributes); end
  def assign_attributes(new_attributes); end
  include ActiveModel::ForbiddenAttributesProtection
end
module ActiveModel::Conversion
  def to_key; end
  def to_model; end
  def to_param; end
  def to_partial_path; end
  extend ActiveSupport::Concern
end
module ActiveModel::Conversion::ClassMethods
  def _to_partial_path; end
end
module ActiveModel::Validations
  def errors; end
  def initialize_dup(other); end
  def invalid?(context = nil); end
  def raise_validation_error; end
  def read_attribute_for_validation(*arg0); end
  def run_validations!; end
  def valid?(context = nil); end
  def validate!(context = nil); end
  def validate(context = nil); end
  def validates_with(*args, &block); end
  extend ActiveSupport::Concern
end
module ActiveModel::Validations::HelperMethods
  def _merge_attributes(attr_names); end
  def validates_absence_of(*attr_names); end
  def validates_acceptance_of(*attr_names); end
  def validates_confirmation_of(*attr_names); end
  def validates_exclusion_of(*attr_names); end
  def validates_format_of(*attr_names); end
  def validates_inclusion_of(*attr_names); end
  def validates_length_of(*attr_names); end
  def validates_numericality_of(*attr_names); end
  def validates_presence_of(*attr_names); end
  def validates_size_of(*attr_names); end
end
module ActiveModel::Validations::Callbacks
  def run_validations!; end
  extend ActiveSupport::Concern
end
module ActiveModel::Validations::Callbacks::ClassMethods
  def after_validation(*args, &block); end
  def before_validation(*args, &block); end
end
module ActiveModel::Validations::Clusivity
  def check_validity!; end
  def delimiter; end
  def include?(record, value); end
  def inclusion_method(enumerable); end
end
class ActiveModel::Validator
  def initialize(options = nil); end
  def kind; end
  def options; end
  def self.kind; end
  def validate(record); end
end
class ActiveModel::EachValidator < ActiveModel::Validator
  def attributes; end
  def check_validity!; end
  def initialize(options); end
  def validate(record); end
  def validate_each(record, attribute, value); end
end
class ActiveModel::BlockValidator < ActiveModel::EachValidator
  def initialize(options, &block); end
  def validate_each(record, attribute, value); end
end
class ActiveModel::Validations::ExclusionValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value); end
  include ActiveModel::Validations::Clusivity
end
class ActiveModel::Validations::AcceptanceValidator < ActiveModel::EachValidator
  def acceptable_option?(value); end
  def initialize(options); end
  def setup!(klass); end
  def validate_each(record, attribute, value); end
end
class ActiveModel::Validations::AcceptanceValidator::LazilyDefineAttributes < Module
  def initialize(attribute_definition); end
end
class ActiveModel::Validations::AcceptanceValidator::AttributeDefinition
  def attributes; end
  def convert_to_reader_name(method_name); end
  def define_on(klass); end
  def initialize(attributes); end
  def matches?(method_name); end
end
class ActiveModel::Validations::WithValidator < ActiveModel::EachValidator
  def validate_each(record, attr, val); end
end
module ActiveModel::Validations::ClassMethods
  def _parse_validates_options(options); end
  def _validates_default_keys; end
  def attribute_method?(attribute); end
  def clear_validators!; end
  def inherited(base); end
  def validate(*args, &block); end
  def validates!(*attributes); end
  def validates(*attributes); end
  def validates_each(*attr_names, &block); end
  def validates_with(*args, &block); end
  def validators; end
  def validators_on(*attributes); end
end
class ActiveModel::Validations::LengthValidator < ActiveModel::EachValidator
  def check_validity!; end
  def initialize(options); end
  def skip_nil_check?(key); end
  def validate_each(record, attribute, value); end
end
class ActiveModel::Validations::ConfirmationValidator < ActiveModel::EachValidator
  def confirmation_value_equal?(record, attribute, value, confirmed); end
  def initialize(options); end
  def setup!(klass); end
  def validate_each(record, attribute, value); end
end
class ActiveModel::Validations::AbsenceValidator < ActiveModel::EachValidator
  def validate_each(record, attr_name, value); end
end
class ActiveModel::Validations::InclusionValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value); end
  include ActiveModel::Validations::Clusivity
end
class ActiveModel::Validations::FormatValidator < ActiveModel::EachValidator
  def check_options_validity(name); end
  def check_validity!; end
  def option_call(record, name); end
  def record_error(record, attribute, name, value); end
  def regexp_using_multiline_anchors?(regexp); end
  def validate_each(record, attribute, value); end
end
class ActiveModel::Validations::PresenceValidator < ActiveModel::EachValidator
  def validate_each(record, attr_name, value); end
end
class ActiveModel::Validations::NumericalityValidator < ActiveModel::EachValidator
  def allow_only_integer?(record); end
  def check_validity!; end
  def filtered_options(value); end
  def is_integer?(raw_value); end
  def is_number?(raw_value); end
  def parse_raw_value_as_a_number(raw_value); end
  def record_attribute_changed_in_place?(record, attr_name); end
  def validate_each(record, attr_name, value); end
end
class ActiveModel::ValidationError < StandardError
  def initialize(model); end
  def model; end
end
module ActiveModel::Dirty
  def attribute_change(attr); end
  def attribute_changed?(attr, from: nil, to: nil); end
  def attribute_changed_by_setter?(attr_name); end
  def attribute_previous_change(attr); end
  def attribute_previously_changed?(attr); end
  def attribute_was(attr); end
  def attribute_will_change!(attr); end
  def attributes_changed_by_setter; end
  def changed; end
  def changed?; end
  def changed_attributes; end
  def changes; end
  def changes_applied; end
  def changes_include?(attr_name); end
  def clear_attribute_changes(attributes); end
  def clear_changes_information; end
  def previous_changes; end
  def previous_changes_include?(attr_name); end
  def restore_attribute!(attr); end
  def restore_attributes(attributes = nil); end
  def set_attribute_was(attr, old_value); end
  extend ActiveSupport::Concern
  include ActiveModel::AttributeMethods
end
module ActiveModel::Serialization
  def read_attribute_for_serialization(*arg0); end
  def serializable_add_includes(options = nil); end
  def serializable_hash(options = nil); end
end
module ActiveModel::Serializers::JSON
  def as_json(options = nil); end
  def from_json(json, include_root = nil); end
  extend ActiveSupport::Concern
  include ActiveModel::Serialization
end
