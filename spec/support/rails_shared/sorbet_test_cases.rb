# typed: false
require 'sorbet-runtime'

wizard = Wizard.first!
T.assert_type!(wizard, Wizard)

# -- model columns
T.assert_type!(wizard.name, T.nilable(String))

# -- model associations
T.assert_type!(wizard.wand, T.nilable(Wand))
T.assert_type!(T.must(wizard.wand).wizard, Wizard)

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

# ActiveRecord Querying
T.assert_type!(Wizard.where(id: 1), ActiveRecord::Relation)
T.reveal_type(Wizard.where(id: 1)) # Wizard::Relation
T.assert_type!(Wizard.preload(:spell_books), ActiveRecord::Relation)
T.reveal_type(Wizard.preload(:spell_books)) # Wizard::Relation
T.assert_type!(Wizard.eager_load(:spell_books), ActiveRecord::Relation)
T.reveal_type(Wizard.eager_load(:spell_books)) # Wizard::Relation
T.assert_type!(Wizard.order(:id), ActiveRecord::Relation)
T.reveal_type(Wizard.order(:id)) # Wizard::Relation

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
# T.assert_type!(wizard.spell_books.first, T.nilable(SpellBook)) # TODO fix sig for 4.2 and 5.0
T.assert_type!(wizard.spell_books.last!, SpellBook)
# T.assert_type!(wizard.spell_books.last, T.nilable(SpellBook)) # TODO fix sig for 4.2 and 5.0
T.assert_type!(wizard.spell_books.first_n(5), T::Array[SpellBook])
T.assert_type!(wizard.spell_books.last_n(5), T::Array[SpellBook])
T.assert_type!(wizard.spell_books.find_by(name: 'Fantastic Beasts'), T.nilable(SpellBook))
T.assert_type!(wizard.spell_books.find_by!(name: 'Fantastic Beasts'), SpellBook)
T.assert_type!(wizard.spell_books.find_by_id(spell_book.id), T.nilable(SpellBook))
T.assert_type!(wizard.spell_books.find_by_id!(spell_book.id), SpellBook)

# Enumerable
T.assert_type!(Wizard.all.to_a, T::Array[Wizard])
Wizard.all.each do |w|
  T.assert_type!(w, Wizard)
end
Wizard.all.map do |w|
  T.assert_type!(w, Wizard) # TODO this doesn't work on Rails 4.2 or 5.0
end
Wizard.all.to_a.map do |w|
  T.assert_type!(w, Wizard)
end

T.assert_type!(wizard.spell_books.to_a, T::Array[SpellBook])
wizard.spell_books.each do |sp|
  T.assert_type!(sp, SpellBook)
end
wizard.spell_books.map do |sp|
  T.assert_type!(sp, SpellBook) # TODO this doesn't work on Rails 4.2 or 5.0
end
wizard.spell_books.to_a.map do |sp|
  T.assert_type!(sp, SpellBook) # This works on Rails 4.2
end

# Model columns
T.assert_type!(wizard.id, Integer)
T.assert_type!(wizard.id?, T::Boolean)
T.assert_type!(wizard.notes, T.nilable(String))
T.assert_type!(wizard.house, String)

# Model enum
T.assert_type!(wizard.Gryffindor?, T::Boolean)
T.assert_type!(Wizard.houses, T::Hash[T.any(String, Symbol), Integer])

# Mythical plugin
T.assert_type!(Wand.mythicals, T::Array[Wand])
