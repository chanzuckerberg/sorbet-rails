# typed: true

class HelperRbiFormatter
  # @param [Array<String>] helpers
  # @return [void]
  def initialize(helpers)
    @helpers = helpers
  end

  # Generates RBI file's contents.
  # @return [String]
  def generate_rbi
    rbi = <<~RBI
      # typed: strong

    RBI

    @helpers.each do |helper|
      rbi += <<~RBI
        module #{helper}
          include Kernel
        end

      RBI
    end

    return rbi
  end
end
