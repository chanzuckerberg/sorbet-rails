# typed: strong
module SorbetRails
  class MailerRbiFormatter
    extend T::Sig
    Parameter = ::Parlour::RbiGenerator::Parameter

    sig { returns(T.class_of(ActionMailer::Base)) }
    attr_reader :mailer_class

    sig { returns(Parlour::RbiGenerator) }
    def rbi_generator; end

    sig { void }
    def populate_rbi; end
  end

  class JobRbiFormatter
    Parameter = ::Parlour::RbiGenerator::Parameter

    sig { returns(Parlour::RbiGenerator) }
    attr_reader :rbi_generator

    sig { returns(T.class_of(ActiveJob::Base)) }
    attr_reader :job_class

    sig { void }
    def populate_rbi; end
  end
end
