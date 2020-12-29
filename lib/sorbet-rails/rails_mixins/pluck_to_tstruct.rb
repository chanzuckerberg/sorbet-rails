# typed: false
require 'sorbet-runtime'

module SorbetRails::PluckToTStruct
  extend T::Sig

  NILCLASS_STRING = "NilClass".freeze

  sig {
    type_parameters(:U).
    params(
      ta_struct: ITypeAssert[T.type_parameter(:U)],
      associations: T::Hash[Symbol, String],
    ).
    returns(T::Array[T.type_parameter(:U)])
  }
  def pluck_to_tstruct(ta_struct, associations: {})
    tstruct = ta_struct.get_type

    if !(tstruct < T::Struct)
      raise UnexpectedType.new("pluck_to_tstruct expects a tstruct subclass, given #{tstruct}")
    end

    tstruct_props = tstruct.props
    tstruct_keys = tstruct_props.keys
    associations_keys = associations.keys
    invalid_keys = associations_keys - tstruct_keys

    if invalid_keys.any?
      raise UnexpectedAssociations.new("Argument 'associations' contains keys that don't exist in #{tstruct}: #{invalid_keys.join(", ")}")
    end

    pluck_keys = (tstruct_keys - associations_keys) + associations.values

    # loosely based on pluck_to_hash gem
    # https://github.com/girishso/pluck_to_hash/blob/master/lib/pluck_to_hash.rb
    keys_one = pluck_keys.size == 1
    pluck(*pluck_keys).map do |row|
      row = [row] if keys_one
      value = Hash[map_nil_values_to_default(tstruct_props, tstruct_keys.zip(row))]
      tstruct.new(value)
    end
  end

  sig {params(type_object: T::Types::Base).returns(T::Boolean)}
  private def nilable?(type_object)
    return false unless type_object.is_a?(T::Types::Union)

    type_object.types.any? { |type| type.name == NILCLASS_STRING }
  end

  sig {
    params(
      tstruct_props: T::Hash[Symbol, T.untyped],
      zipped_rows: T::Array[[Symbol, T.untyped]]
    )
    .returns(T::Array[[Symbol, T.untyped]])
  }
  private def map_nil_values_to_default(tstruct_props, zipped_rows)
    # we use the default value defined on a prop if
    # 1. the plucked value is nil
    # 2. the prop has a default
    # 3. the prop's type isn't nilable

    zipped_rows.map do |key, value|
      next [key, value] unless value.nil?

      default = tstruct_props.dig(key, :default)
      next [key, value] unless default

      type_object = tstruct_props.dig(key, :type_object)
      next [key, value] if nilable?(type_object)

      [key, default]
    end
  end

  class UnexpectedType < StandardError; end
  class UnexpectedAssociations < StandardError; end
end
