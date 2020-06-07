# typed: false
require 'sorbet-runtime'

module SorbetRails::PluckToTStruct
  extend T::Sig
  sig {
    type_parameters(:U).
    params(
      ta_struct: ITypeAssert[T.type_parameter(:U)],
      associations: T::Hash[Symbol, String]
    ).
    returns(T::Array[T.type_parameter(:U)])
  }
  def pluck_to_tstruct(ta_struct, associations: {})
    tstruct = ta_struct.get_type

    if !(tstruct < T::Struct)
      raise UnexpectedType.new("pluck_to_tstruct expects a tstruct subclass, given #{tstruct}")
    end

    tstruct_keys = tstruct.props.keys
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
      value = Hash[tstruct_keys.zip(row)]
      tstruct.new(value)
    end
  end

  class UnexpectedType < StandardError; end
  class UnexpectedAssociations < StandardError; end
end
