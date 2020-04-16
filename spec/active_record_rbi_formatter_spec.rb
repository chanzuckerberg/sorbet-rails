require 'rails_helper'
require 'sorbet-rails/active_record_rbi_formatter'

RSpec.describe SorbetRails::ActiveRecordRbiFormatter do
  describe 'generate_active_record_base_rbi' do
    it 'returns the expected rbi' do
      formatter = SorbetRails::ActiveRecordRbiFormatter.new
      expect_match_file(
        formatter.generate_active_record_base_rbi,
        'expected_active_record_base.rbi'
      )
    end
  end

  describe 'generate_active_record_relation_rbi' do
    it 'returns the expected rbi' do
      formatter = SorbetRails::ActiveRecordRbiFormatter.new
      expect_match_file(
        formatter.generate_active_record_relation_rbi,
        'expected_active_record_relation.rbi'
      )
    end
  end
end
