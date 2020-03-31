require 'rails_helper'

RSpec.describe 'rake rails_rbi:jobs', type: :task do
  let!(:generated_dir_path) { Rails.root.join("sorbet", "rails-rbi", "jobs") }

  it "preloads the Rails environment" do
    expect(task.prerequisites).to include("environment")
  end

  it "generates jobs rbi correctly" do
    task.invoke
    expect_files(
      base_dir: generated_dir_path,
      files: [
        "application_job.rbi",
        "award_house_point_hourglasses.rbi",
      ],
    )
  end
end
