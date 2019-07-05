require 'rails_helper'

RSpec.describe 'rake rails_rbi:routes', type: :task do
  it "preloads the Rails environment" do
    expect(task.prerequisites).to include("environment")
  end

  it "generates routes.rbi correctly" do
    task.invoke
    expected_path = Rails.root.join("sorbet", "rails-rbi", "routes.rbi")
    generated = File.read(expected_path)
    expect_match_file(generated, 'expected_routes.rbi')
  end
end
