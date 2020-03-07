require 'rails_helper'
require 'sorbet-runtime'
require 'sorbet-rails/sorbet_utils'

module SorbetUtilsExampleModule
end

class SorbetUtilsExampleClass
  extend T::Sig

  sig { void }
  def no_param_method; end

  sig { params(p1: String, p2: T.class_of(String)).void }
  def method_req_args(p1, p2); end

  sig { params(p1: T.any(String, Integer), p2: T.nilable(String)).void }
  def method_req_kwarg(p1:, p2:); end

  sig { params(p1: SorbetUtilsExampleModule, p2: T.nilable(T.any(String, Integer))).void }
  def method_mixed(p1, p2:); end

  sig { params(p1: T::Hash[String, T.untyped], p2: Integer).void }
  def method_with_rest(p1, *p2); end

  sig { params(p1: T::Array[String], p2: T::Set[Integer], p3: Integer).void }
  def method_with_keyrest(p1, p2:, **p3); end

  sig { params(p1: String, p2: T.proc.params(p3: T.class_of(String)).void).void }
  def method_with_block(*p1, &p2); end

  sig { params(p1: T.proc.params(p3: T.class_of(String)).returns(T.nilable(String))).void }
  def method_with_block_return(&p1); end

  def method_without_sig(p1, p2, *p3, p4:, **p5, &p6); end

  sig { params(p1: String, p2: String, p3: Integer, p4: Integer).void }
  def method_with_default_with_sig(p1, p2='abc', p3:, p4: 123); end

  def method_with_default(p1, p2='abc', p3:, p4: 123); end

  def method_with_missing_args_name(p1, *); end

  def method_with_missing_kwargs_name(p1, **); end
end

RSpec.describe SorbetRails::SorbetUtils do
  Parameter = ::Parlour::RbiGenerator::Parameter

  it 'works with no_param_method' do
    method_def = SorbetUtilsExampleClass.instance_method(:no_param_method)
    parameters = SorbetRails::SorbetUtils.parameters_from_method_def(method_def)
    expect(parameters).to match_array([])
  end

  it 'works with method_req_args' do
    method_def = SorbetUtilsExampleClass.instance_method(:method_req_args)
    parameters = SorbetRails::SorbetUtils.parameters_from_method_def(method_def)
    expect(parameters).to match_array([
      Parameter.new('p1', type: 'String'),
      Parameter.new('p2', type: 'T.class_of(String)'),
    ])
  end

  it 'works with method_req_kwarg' do
    method_def = SorbetUtilsExampleClass.instance_method(:method_req_kwarg)
    parameters = SorbetRails::SorbetUtils.parameters_from_method_def(method_def)
    expect(parameters).to match_array([
      Parameter.new('p1:', type: 'T.any(Integer, String)'), # sorbet re-order the types
      Parameter.new('p2:', type: 'T.nilable(String)'),
    ])
  end

  it 'works with method_mixed' do
    method_def = SorbetUtilsExampleClass.instance_method(:method_mixed)
    parameters = SorbetRails::SorbetUtils.parameters_from_method_def(method_def)
    expect(parameters).to match_array([
      Parameter.new('p1', type: 'SorbetUtilsExampleModule'),
      Parameter.new('p2:', type: 'T.nilable(T.any(Integer, String))'),
    ])
  end

  it 'works with method_with_rest' do
    method_def = SorbetUtilsExampleClass.instance_method(:method_with_rest)
    parameters = SorbetRails::SorbetUtils.parameters_from_method_def(method_def)
    expect(parameters).to match_array([
      Parameter.new('p1', type: 'T::Hash[String, T.untyped]'),
      Parameter.new('*p2', type: 'Integer'),
    ])
  end

  it 'works with method_with_keyrest' do
    method_def = SorbetUtilsExampleClass.instance_method(:method_with_keyrest)
    parameters = SorbetRails::SorbetUtils.parameters_from_method_def(method_def)
    expect(parameters).to match_array([
      Parameter.new('p1', type: 'T::Array[String]'),
      Parameter.new('p2:', type: 'T::Set[Integer]'),
      Parameter.new('**p3', type: 'Integer'),
    ])
  end

  it 'works with method_with_block' do
    method_def = SorbetUtilsExampleClass.instance_method(:method_with_block)
    parameters = SorbetRails::SorbetUtils.parameters_from_method_def(method_def)
    expect(parameters).to match_array([
      Parameter.new('*p1', type: 'String'),
      Parameter.new('&p2', type: 'T.proc.params(p3: T.class_of(String)).void'),
    ])
  end

  it 'works with method_with_block_return' do
    method_def = SorbetUtilsExampleClass.instance_method(:method_with_block_return)
    parameters = SorbetRails::SorbetUtils.parameters_from_method_def(method_def)
    expect(parameters).to match_array([
      Parameter.new(
        '&p1',
        type: 'T.proc.params(p3: T.class_of(String)).returns(T.nilable(String))',
      ),
    ])
  end

  it 'works with method_without_sig' do
    method_def = SorbetUtilsExampleClass.instance_method(:method_without_sig)
    parameters = SorbetRails::SorbetUtils.parameters_from_method_def(method_def)
    # method_without_sig(p1, p2, *p3, p4:, **p5, &p6); end
    expect(parameters).to match_array([
      Parameter.new('p1', type: 'T.untyped'),
      Parameter.new('p2', type: 'T.untyped'),
      Parameter.new('*p3', type: 'T.untyped'),
      Parameter.new('p4:', type: 'T.untyped'),
      Parameter.new('**p5', type: 'T.untyped'),
      Parameter.new('&p6', type: 'T.untyped'),
    ])
  end

  it 'works when method arguments have default' do
    method_def = SorbetUtilsExampleClass.instance_method(:method_with_default)
    parameters = SorbetRails::SorbetUtils.parameters_from_method_def(method_def)
    expect(parameters).to match_array([
      Parameter.new('p1', type: 'T.untyped'),
      Parameter.new('p2', type: 'T.untyped', default: "'abc'"),
      Parameter.new('p3:', type: 'T.untyped'),
      Parameter.new('p4:', type: 'T.untyped', default: '123'),
    ])
  end

  it 'works when method arguments have default and method has sig' do
    method_def = SorbetUtilsExampleClass.instance_method(:method_with_default_with_sig)
    parameters = SorbetRails::SorbetUtils.parameters_from_method_def(method_def)
    expect(parameters).to match_array([
      Parameter.new('p1', type: 'String'),
      Parameter.new('p2', type: 'String', default: "'abc'"),
      Parameter.new('p3:', type: 'Integer'),
      Parameter.new('p4:', type: 'Integer', default: '123'),
    ])
  end

  it 'works when method args doesnt have name' do
    method_def = SorbetUtilsExampleClass.instance_method(:method_with_missing_args_name)
    parameters = SorbetRails::SorbetUtils.parameters_from_method_def(method_def)
    expect(parameters).to match_array([
      Parameter.new('p1', type: 'T.untyped'),
      Parameter.new('*_', type: 'T.untyped'),
    ])
  end

  it 'works when method kwargs doesnt have name' do
    method_def = SorbetUtilsExampleClass.instance_method(:method_with_missing_kwargs_name)
    parameters = SorbetRails::SorbetUtils.parameters_from_method_def(method_def)
    expect(parameters).to match_array([
      Parameter.new('p1', type: 'T.untyped'),
      Parameter.new('**_', type: 'T.untyped'),
    ])
  end
end