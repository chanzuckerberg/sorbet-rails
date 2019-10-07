# typed: false
require 'sorbet-runtime'

module SorbetRails::PluckToTStruct
  extend T::Sig
  sig {
    type_parameters(:U).
    params(
      ta_struct: ITypeAssert[T.type_parameter(:U)],
    ).
    returns(T::Array[T.type_parameter(:U)])
  }
  def pluck_to_tstruct(ta_struct)
    tstruct = ta_struct.get_type
    keys = tstruct.props.keys

    # loosely based on pluck_to_hash gem
    # https://github.com/girishso/pluck_to_hash/blob/master/lib/pluck_to_hash.rb
    keys_one = keys.size == 1
    pluck(*keys).map do |row|
      row = [row] if keys_one
      value = Hash[keys.zip(row)]
      tstruct.new(value)
    end
  end
end
