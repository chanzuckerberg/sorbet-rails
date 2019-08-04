# typed: strict
require(Rails.root.join('lib/mythical_rbi_plugin'))
SorbetRails::ModelRbiFormatter.register_plugin(MythicalRbiPlugin)
