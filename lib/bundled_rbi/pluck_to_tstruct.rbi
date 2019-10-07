# typed: strong

module SorbetRails::PluckToTStruct
  extend T::Sig
  sig {
    type_parameters(:U).
    params(
      ta_struct: ITypeAssert[T.type_parameter(:U)],
    ).
    returns(T::Array[T.type_parameter(:U)])
  }
  def pluck_to_tstruct(ta_struct, &blk); end
end

ActiveRecord::Base.extend SorbetRails::PluckToTStruct
ActiveRecord::Relation.include SorbetRails::PluckToTStruct
