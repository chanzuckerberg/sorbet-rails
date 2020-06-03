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

    unless associations.is_a?(Hash)
      raise ArgumentError.new("pluck_to_tstruct expects associations to be a Hash of #{tstruct}'s props mapped to an associated table's columns.")
    end

    associations_keys = associations.keys
    pluck_keys = (tstruct.props.keys - associations_keys) + associations.values
    keys_to_remove = pluck_keys.select { |key| associations.value?(key) }
    tstruct_keys = (pluck_keys - keys_to_remove) + associations_keys

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
end
