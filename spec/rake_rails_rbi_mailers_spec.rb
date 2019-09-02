require 'rails_helper'

RSpec.describe 'rake rails_rbi:mailers', type: :task do
  let!(:generated_dir_path) { Rails.root.join("sorbet", "rails-rbi", "mailers") }

  it "preloads the Rails environment" do
    expect(task.prerequisites).to include("environment")
  end

  it "generates mailers rbi correctly" do
    task.invoke
    expect_files(
      base_dir: generated_dir_path,
      files: [
        "application_mailer.rbi",
        "daily_prophet_mailer.rbi",
        "hogwarts_acceptance_mailer.rbi",
      ],
    )
  end
end
