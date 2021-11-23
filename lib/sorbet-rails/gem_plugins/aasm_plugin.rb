# typed: false
class AasmPlugin < SorbetRails::ModelPlugins::Base
  sig { override.params(root: Parlour::RbiGenerator::Namespace).void }
  def generate(root)
    return unless @model_class.include?(::AASM)

    model_rbi = root.create_class(
      model_class_name
    )

    aasm_events = @model_class.aasm.events.map(&:name)
    aasm_states = @model_class.aasm.states.map(&:name)

    # If you have an event like :bazify, you get these methods:
    # - `may_bazify?`
    # - `bazify`
    # - `bazify!`
    # - `bazify_without_validation!`
    aasm_events.each do |event|
      model_rbi.create_method(
        "may_#{event}?",
        return_type: 'T::Boolean'
      )

      model_rbi.create_method(
        event.to_s,
        return_type: 'T::Boolean'
      )

      model_rbi.create_method(
        "#{event}!",
        return_type: 'T::Boolean'
      )

      model_rbi.create_method(
        "#{event}_without_validation!",
        return_type: 'T::Boolean'
      )
    end

    # - If you have a state like :baz, you get:
    # - a method `baz?`
    # - a constant `STATE_BAZ`
    aasm_states.each do |state|
      model_rbi.create_method(
        "#{state}?",
        return_type: 'T::Boolean'
      )

      root.create_module(
        "#{model_class_name}::STATE_#{state.to_s.upcase}"
      )
    end
  end
end
