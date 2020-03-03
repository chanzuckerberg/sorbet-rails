# typed: strict
class SorbetRails::RoutesRbiFormatter
  extend T::Sig

  sig { void }
  def initialize
    @parlour = T.let(Parlour::RbiGenerator.new, Parlour::RbiGenerator)
  end

  sig { params(title: String).void }
  def section_title(title)
    nil
  end

  sig { params(routes: T::Array[T::Hash[Symbol, String]]).void }
  def section(routes)
    draw_section(routes)
  end

  sig { params(routes: T.untyped).void }
  def header(routes)
    @parlour.root.add_comments([
      'This is an autogenerated file for Rails routes.',
      'Please run bundle exec rake rails_rbi:routes to regenerate.'
    ])

    @parlour.root.create_class('ActionController::Base') do |klass|
      klass.create_include('GeneratedUrlHelpers')
    end

    @parlour.root.create_module('ActionView::Helpers') do |mod|
      mod.create_include('GeneratedUrlHelpers')
    end

    @parlour.root.create_class('ActionMailer::Base') do |mod|
      mod.create_include('GeneratedUrlHelpers')
    end
  end

  sig { params(routes: T.untyped, filter: T.untyped).void }
  def no_routes(routes = nil, filter = nil)
    @parlour.root.add_comments([
      'You do not have any routes defined!',
      'Please add some routes in config/routes.rb.',
      'For more information about routes, see the Rails guide: https://guides.rubyonrails.org/routing.html.'
    ])
  end

  sig { returns(String) }
  def result
    @parlour.rbi
  end

  private

  sig { params(routes: T::Array[T::Hash[Symbol, String]]).void }
  def draw_section(routes)
    @parlour.root.create_module('GeneratedUrlHelpers') do |klass|
      routes.each do |r|
        next unless r[:name].present?

        klass.add_comment_to_next_child("Sigs for route #{r[:path]}")
        klass.create_method(
          "#{r[:name]}_path",
          parameters: [
            Parlour::RbiGenerator::Parameter.new("*args", type: "T.untyped"),
            Parlour::RbiGenerator::Parameter.new("**kwargs", type: "T.untyped")
          ],
          return_type: "String"
        )
        klass.create_method(
          "#{r[:name]}_url",
          parameters: [
            Parlour::RbiGenerator::Parameter.new("*args", type: "T.untyped"),
            Parlour::RbiGenerator::Parameter.new("**kwargs", type: "T.untyped")
          ],
          return_type: "String"
        )
      end
    end
  end
end
