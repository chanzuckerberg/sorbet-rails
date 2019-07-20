require 'rails_helper'

RSpec.describe 'rake rails_rbi:helpers', type: :task do
  it "preloads the Rails environment" do
    expect(task.prerequisites).to include("environment")
  end

  it "generates helpers.rbi correctly" do
    task.invoke
    expected_path = Rails.root.join("sorbet", "rails-rbi", "helpers.rbi")
    generated = File.read(expected_path)
    expect_match_file(generated, 'expected_helpers.rbi')
  end
end
