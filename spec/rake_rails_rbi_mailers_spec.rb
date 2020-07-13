require 'rails_helper'

RSpec.describe 'rake rails_rbi:mailers', type: :task do
  let!(:generated_dir_path) { Rails.root.join("sorbet", "rails-rbi", "mailers") }

  class CustomMailerRbiGenerator < SorbetRails::MailerRbiFormatter
    def populate_rbi
      rbi_generator.root.add_comment("== Custom Generator ==")
      super
    end
  end

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

  it "generates custom mailers rbi correctly" do
    ::SorbetRails.config.mailer_generator_class = CustomMailerRbiGenerator
    task.invoke
    expect_files(
      base_dir: generated_dir_path,
      files: [
        "application_mailer.rbi",
        "daily_prophet_mailer.rbi",
        "hogwarts_acceptance_mailer.rbi",
      ],
      expected_file_prefix: "expected_custom",
    )
  end
end
