# typed: true
require 'sorbet-coerce'

module TypedParams
  # A sorbet-coerce wrapper for coercing typed controller parameters
  define_singleton_method(:[]) do |type|
    Class.new do
      define_method(:extract!) do |params|
        begin
          T::Coerce[type].new.from(params.permit!.to_h, raise_coercion_error: true)
        rescue StandardError => e
          raise ActionController::BadRequest.new(e)
        end
      end
    end
  end
end
