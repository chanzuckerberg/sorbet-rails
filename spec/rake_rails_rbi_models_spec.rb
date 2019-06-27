require 'rails_helper'
require 'rake_helper'

RSpec.describe 'rake rails_rbi:models', type: :task do
  it "preloads the Rails environment" do
    expect(task.prerequisites).to include "environment"
  end
end
