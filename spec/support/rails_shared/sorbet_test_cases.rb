# typed: true
require 'sorbet-runtime'

wizard = Wizard.first!
T.assert_type!(wizard, Wizard)

# -- model columns
T.assert_type!(wizard.name, T.nilable(String))

# -- model associations
T.assert_type!(wizard.wand, T.nilable(Wand))
T.reveal_type(wizard.wand)

T.assert_type!(wizard.spell_books, ActiveRecord::Associations::CollectionProxy)
T.reveal_type(wizard.spell_books) # SpellBook::CollectionProxy

# -- model relation
# default
T.assert_type!(Wizard.all, ActiveRecord::Relation)
T.reveal_type(Wizard.all) # Wizard::ActiveRecord_Relation

# custom scope
T.assert_type!(Wizard.recent, ActiveRecord::Relation)
T.reveal_type(Wizard.recent)

# enum scope
T.assert_type!(Wizard.Gryffindor, ActiveRecord::Relation)
T.reveal_type(Wizard.Gryffindor)

# chained scopes
T.assert_type!(Wizard.Gryffindor.recent, ActiveRecord::Relation)
T.reveal_type(Wizard.Gryffindor.recent)
T.assert_type!(Wizard.Gryffindor.recent.unscoped, ActiveRecord::Relation)
T.reveal_type(Wizard.Gryffindor.recent.unscoped)
