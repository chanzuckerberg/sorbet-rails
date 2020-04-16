require 'rails_helper'

RSpec.describe 'rake rails_rbi:active_record', type: :task do
  let!(:generated_dir_path) { Rails.root.join("sorbet", "rails-rbi") }

  it "preloads the Rails environment" do
    expect(task.prerequisites).to include("environment")
  end

  it "generates rbi correctly" do
    task.invoke

    expect_files(
      base_dir: generated_dir_path,
      files: [
        "active_record_base.rbi",
        "active_record_relation.rbi",
      ],
    )
  end
end
