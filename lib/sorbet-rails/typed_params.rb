# typed: ignore
require 'sorbet-coerce'

if !$PROGRAM_NAME.include?('sorbet')
  module TypedParams
    # A sorbet-coerce wrapper for coercing typed controller parameters
    define_singleton_method(:[]) do |type|
      Class.new do
        define_method(:extract!) do |params, raise_coercion_error: nil|
          begin
            TypeCoerce[type].new.from(
              params.permit!.to_h,
              raise_coercion_error: raise_coercion_error
            )
          rescue TypeCoerce::CoercionError, TypeCoerce::ShapeError, TypeError, ArgumentError => e
            raise ActionController::BadRequest.new(e)
          end
        end
      end
    end
  end
end
