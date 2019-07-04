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

# Finder methods -- Model
T.assert_type!(Wizard.exists?(name: 'Test'), T::Boolean)
T.assert_type!(Wizard.find(wizard.id), Wizard)
T.assert_type!(Wizard.first!, Wizard)
T.assert_type!(Wizard.first, T.nilable(Wizard))
T.assert_type!(Wizard.last!, Wizard)
T.assert_type!(Wizard.last, T.nilable(Wizard))
T.assert_type!(Wizard.first_n(5), T::Array[Wizard])
T.assert_type!(Wizard.last_n(5), T::Array[Wizard])
T.assert_type!(Wizard.find_by(name: 'Harry Potter'), T.nilable(Wizard))
T.assert_type!(Wizard.find_by!(name: 'Harry Potter'), Wizard)
T.assert_type!(Wizard.find_by_id(wizard.id), T.nilable(Wizard))
T.assert_type!(Wizard.find_by_id!(wizard.id), Wizard)

# Finder methods -- ActiveRecord::Relation
T.assert_type!(Wizard.all.exists?(name: 'Harry Potter'), T::Boolean)
T.assert_type!(Wizard.all.find(wizard.id), Wizard)
T.assert_type!(Wizard.all.first!, Wizard)
T.assert_type!(Wizard.all.first, T.nilable(Wizard))
T.assert_type!(Wizard.all.last!, Wizard)
T.assert_type!(Wizard.all.last, T.nilable(Wizard))
T.assert_type!(Wizard.all.first_n(5), T::Array[Wizard])
T.assert_type!(Wizard.all.last_n(5), T::Array[Wizard])
T.assert_type!(Wizard.all.find_by(name: 'Harry Potter'), T.nilable(Wizard))
T.assert_type!(Wizard.all.find_by!(name: 'Harry Potter'), Wizard)
T.assert_type!(Wizard.all.find_by_id(wizard.id), T.nilable(Wizard))
T.assert_type!(Wizard.all.find_by_id!(wizard.id), Wizard)

# Finder methods -- CollectionProxy
spell_book = wizard.spell_books.first!
T.assert_type!(wizard.spell_books.exists?(name: 'Fantastic Beasts'), T::Boolean)
T.assert_type!(wizard.spell_books.find(spell_book.id), SpellBook)
T.assert_type!(wizard.spell_books.first!, SpellBook)
T.assert_type!(wizard.spell_books.first, T.nilable(SpellBook))
T.assert_type!(wizard.spell_books.last!, SpellBook)
T.assert_type!(wizard.spell_books.last, T.nilable(SpellBook))
T.assert_type!(wizard.spell_books.first_n(5), T::Array[SpellBook])
T.assert_type!(wizard.spell_books.last_n(5), T::Array[SpellBook])
T.assert_type!(wizard.spell_books.find_by(name: 'Fantastic Beasts'), T.nilable(SpellBook))
T.assert_type!(wizard.spell_books.find_by!(name: 'Fantastic Beasts'), SpellBook)
T.assert_type!(wizard.spell_books.find_by_id(spell_book.id), T.nilable(SpellBook))
T.assert_type!(wizard.spell_books.find_by_id!(spell_book.id), SpellBook)

# Dirty
T.assert_type!(wizard.attribute_changed?(:name), T::Boolean)
T.assert_type!(wizard.saved_change_to_attribute?(:name), T::Boolean)

# Enumerable
T.assert_type!(Wizard.all.to_a, T::Array[Wizard])
Wizard.all.each do |w|
  T.assert_type!(w, Wizard)
end
Wizard.all.map do |w|
  T.assert_type!(w, Wizard)
end
wizard.spell_books.each do |sp|
  T.assert_type!(sp, SpellBook)
end
wizard.spell_books.map do |sp|
  T.assert_type!(sp, SpellBook)
end
