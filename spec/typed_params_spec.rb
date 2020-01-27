# typed: false
require 'rails_helper'
require 'sorbet-runtime'
require 'sorbet-rails/typed_params'

module TypedParamsSpec
  class Params < T::Struct
    const :a, Integer
  end
end

RSpec.describe TypedParams do
  it 'works as expected' do
    expect(TypedParams[TypedParamsSpec::Params].new.extract!(
      ActionController::Parameters.new(a: '1'),
    ).a).to be(1)

    expect {
      TypedParams[TypedParamsSpec::Params].new.extract!(
        ActionController::Parameters.new(a: 'abc'),
      )
    }.to raise_error(ActionController::BadRequest)
  end
end
