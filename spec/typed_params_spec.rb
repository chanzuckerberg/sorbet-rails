# typed: false
require 'rails_helper'
require 'sorbet-runtime'
require 'sorbet-rails/typed_params'

module TypedParamsSpec
  class MyActionParams < T::Struct
    class Info < T::Struct
      const :birthday, Date
      const :friends, T::Array[String]
      const :grandson, T.nilable(String)
    end

    const :age, Integer
    const :name, String
    const :info, Info
  end

end

RSpec.describe TypedParams do
  it 'works as expected' do
    params = ActionController::Parameters.new({
      age: 11,
      name: 'Harry Potter',
      info: {
        birthday: Date.parse('1980-07-31'),
        friends: [
          'Hermione',
          'Ron',
        ],
        grandson: nil,
      },
    })

    typed_params = TypedParams[TypedParamsSpec::MyActionParams].new.extract!(params)
    expect(typed_params.age).to eql 11
    expect(typed_params.name).to eql 'Harry Potter'
    expect(typed_params.info.birthday).to eql Date.parse('1980-07-31')
    expect(typed_params.info.friends).to eql ['Hermione', 'Ron']
    expect(typed_params.info.grandson).to be_nil

    expect {
      TypedParams[TypedParamsSpec::MyActionParams].new.extract!(
        ActionController::Parameters.new({
          age: 'invalid_age',
          name: 'Harry Potter',
          info: {
            birthday: Date.parse('1980-07-31'),
            friends: [
              'Hermione',
              'Ron',
            ],
            grandson: nil,
          },
        })
      )
    }.to raise_error(ActionController::BadRequest)

    expect {
      TypedParams[TypedParamsSpec::MyActionParams].new.extract!(
        ActionController::Parameters.new({
          # missing age
          name: 'Harry Potter',
          info: {
            birthday: Date.parse('1980-07-31'),
            friends: [
              'Hermione',
              'Ron',
            ],
            grandson: nil,
          },
        })
      )
    }.to raise_error(ActionController::BadRequest)

    expect {
      TypedParams[TypedParamsSpec::MyActionParams].new.extract!(
        ActionController::Parameters.new({
          # missing age
          name: 'Harry Potter',
          info: {
            birthday: Date.parse('1980-07-31'),
            friends: 'not an array',
            grandson: nil,
          },
        })
      )
    }.to raise_error(ActionController::BadRequest)
  end
end
