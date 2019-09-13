# typed: false
require 'sorbet-runtime'

wizard = Wizard.first!
T.assert_type!(wizard, Wizard)

# -- model columns
T.assert_type!(wizard.name, T.nilable(String))

# -- model associations
T.assert_type!(wizard.wand, T.nilable(Wand))
T.assert_type!(T.must(wizard.wand).wizard, Wizard)

# need the exact type to works! they aren't subclass of each other
# T.assert_type!(wizard.spell_books, SpellBook::ActiveRecord_Relation)
# T.assert_type!(wizard.spell_books, SpellBook::ActiveRecord_AssociationRelation)
T.assert_type!(wizard.spell_books, SpellBook::ActiveRecord_Associations_CollectionProxy)

# -- model relation
# default
T.assert_type!(Wizard.all, Wizard::ActiveRecord_Relation)

# custom scope
T.assert_type!(Wizard.recent, Wizard::ActiveRecord_Relation)

# enum scope
T.assert_type!(Wizard.Gryffindor, Wizard::ActiveRecord_Relation)

# ActiveRecord Querying
T.assert_type!(Wizard.Gryffindor.recent, Wizard::ActiveRecord_Relation)
T.assert_type!(Wizard.Gryffindor.recent.unscoped, Wizard::ActiveRecord_Relation)
T.assert_type!(Wizard.where(id: 1), Wizard::ActiveRecord_Relation)
T.assert_type!(Wizard.where(id: 1).recent, Wizard::ActiveRecord_Relation)
T.assert_type!(Wizard.where.not(id: 1), Wizard::ActiveRecord_Relation)
T.assert_type!(Wizard.preload(:spell_books), Wizard::ActiveRecord_Relation)
T.assert_type!(Wizard.eager_load(:spell_books), Wizard::ActiveRecord_Relation)
T.assert_type!(Wizard.order(:id), Wizard::ActiveRecord_Relation)

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
spell_books = wizard.spell_books
T.assert_type!(spell_books.exists?(name: 'Fantastic Beasts'), T::Boolean)
T.assert_type!(spell_books.find(spell_book.id), SpellBook)
T.assert_type!(spell_books.first!, SpellBook)
# T.assert_type!(spell_books.first, T.nilable(SpellBook)) # TODO fix sig for 4.2 and 5.0
T.assert_type!(spell_books.last!, SpellBook)
# T.assert_type!(spell_books.last, T.nilable(SpellBook)) # TODO fix sig for 4.2 and 5.0
T.assert_type!(spell_books.first_n(5), T::Array[SpellBook])
T.assert_type!(spell_books.last_n(5), T::Array[SpellBook])
T.assert_type!(spell_books.find_by(name: 'Fantastic Beasts'), T.nilable(SpellBook))
T.assert_type!(spell_books.find_by!(name: 'Fantastic Beasts'), SpellBook)
T.assert_type!(spell_books.find_by_id(spell_book.id), T.nilable(SpellBook))
T.assert_type!(spell_books.find_by_id!(spell_book.id), SpellBook)
# CollectionProxy query also typed correctly!
T.assert_type!(spell_books.where(id: 1), SpellBook::ActiveRecord_AssociationRelation)
T.assert_type!(spell_books.preload(:wizard), SpellBook::ActiveRecord_AssociationRelation)
T.assert_type!(spell_books.eager_load(:wizard), SpellBook::ActiveRecord_AssociationRelation)
T.assert_type!(spell_books.order(:id), SpellBook::ActiveRecord_AssociationRelation)
T.assert_type!(spell_books.where.not(id: 1), SpellBook::ActiveRecord_AssociationRelation)
T.assert_type!(spell_books.biology, SpellBook::ActiveRecord_AssociationRelation)

# finder methods -- AssociationRelation
spell_books_query = spell_books.where(id: 1)
T.assert_type!(spell_books_query.exists?(name: 'Fantastic Beasts'), T::Boolean)
T.assert_type!(spell_books_query.find(spell_book.id), SpellBook)
T.assert_type!(spell_books_query.first!, SpellBook)
# T.assert_type!(spell_books_query.first, T.nilable(SpellBook)) # TODO fix sig for 4.2 and 5.0
T.assert_type!(spell_books_query.last!, SpellBook)
# T.assert_type!(spell_books_query.last, T.nilable(SpellBook)) # TODO fix sig for 4.2 and 5.0
T.assert_type!(spell_books_query.first_n(5), T::Array[SpellBook])
T.assert_type!(spell_books_query.last_n(5), T::Array[SpellBook])
T.assert_type!(spell_books_query.find_by(name: 'Fantastic Beasts'), T.nilable(SpellBook))
T.assert_type!(spell_books_query.find_by!(name: 'Fantastic Beasts'), SpellBook)
T.assert_type!(spell_books_query.find_by_id(spell_book.id), T.nilable(SpellBook))
T.assert_type!(spell_books_query.find_by_id!(spell_book.id), SpellBook)
# Query chaining
T.assert_type!(spell_books_query.preload(:wizard), SpellBook::ActiveRecord_AssociationRelation)
T.assert_type!(spell_books_query.eager_load(:wizard), SpellBook::ActiveRecord_AssociationRelation)
T.assert_type!(spell_books_query.order(:id), SpellBook::ActiveRecord_AssociationRelation)
T.assert_type!(spell_books_query.where.not(id: 1), SpellBook::ActiveRecord_AssociationRelation)
T.assert_type!(spell_books_query.biology, SpellBook::ActiveRecord_AssociationRelation)

# Enumerable on activerecord relation
T.assert_type!(Wizard.all.to_a, T::Array[Wizard])
Wizard.all.each do |w|
  T.assert_type!(w, Wizard)
end
Wizard.all.map do |w|
  T.assert_type!(w, Wizard)
end
Wizard.all.to_a.map do |w|
  T.assert_type!(w, Wizard)
end

# enum on association collection proxy
T.assert_type!(wizard.spell_books.to_a, T::Array[SpellBook])
wizard.spell_books.each do |sp|
  T.assert_type!(sp, SpellBook)
end
wizard.spell_books.map do |sp|
  T.assert_type!(sp, SpellBook)
end
wizard.spell_books.to_a.map do |sp|
  T.assert_type!(sp, SpellBook)
end

# enum on association relation
T.assert_type!(wizard.spell_books.where(id: 1).to_a, T::Array[SpellBook])
wizard.spell_books.where(id: 1).each do |sp|
  T.assert_type!(sp, SpellBook)
end
wizard.spell_books.where(id: 1).map do |sp|
  T.assert_type!(sp, SpellBook)
end
wizard.spell_books.where(id: 1).to_a.map do |sp|
  T.assert_type!(sp, SpellBook)
end

# Model columns
T.assert_type!(wizard.id, Integer)
T.assert_type!(wizard.id?, T::Boolean)
T.assert_type!(wizard.notes, T.nilable(String))

# Model enum
T.assert_type!(wizard.Gryffindor?, T::Boolean)
T.assert_type!(wizard.house, T.nilable(String))
T.assert_type!(Wizard.houses, T::Hash[T.any(String, Symbol), Integer])
T.assert_type!(Wizard.brooms, T::Hash[T.any(String, Symbol), String])
T.assert_type!(spell_book.biology?, T::Boolean)
T.assert_type!(spell_book.book_type, String)
T.assert_type!(SpellBook.book_types, T::Hash[T.any(String, Symbol), Integer])

# Mythical plugin
T.assert_type!(Wand.mythicals, T::Array[Wand])

T.assert_type!(HogwartsAcceptanceMailer.notify(wizard), ActionMailer::MessageDelivery)

if ENV["RAILS_VERSION"] != "4.2"
  T.assert_type!(wizard.broom_nimbus?, T::Boolean)
  T.assert_type!(wizard.color_brown_eyes?, T::Boolean)
  T.assert_type!(wizard.quidditch_keeper?, T::Boolean)
  T.assert_type!(wizard.brown_hair?, T::Boolean)
end

# -- Custom ActionController::Parameters Methods
params = ActionController::Parameters.new({
  age: 11,
  name: 'Harry Potter',
  info: {
    birthday: Date.parse('1980-07-31'),
    friends: [
      'Hermione',
      'Ron',
    ],
    grandson: nil,
  },
})
# -- require_typed
T.assert_type!(
  params.require_typed(:age, TA[Integer].new),
  Integer,
)
T.assert_type!(
  params.require_typed(:name, TA[String].new),
  String,
)
info = params.require_typed(:info, TA[ActionController::Parameters].new)
T.assert_type!(info, ActionController::Parameters)
T.assert_type!(
  info.require_typed(:friends, TA[T::Array[String]].new),
  T::Array[String],
)
# -- fetch_typed
T.assert_type!(
  params.fetch_typed(:age, TA[Integer].new),
  Integer,
)
T.assert_type!(
  params.fetch_typed(:name, TA[String].new),
  String,
)
T.assert_type!(
  params.fetch_typed(:nonexistence, TA[String].new, ''),
  String,
)
T.assert_type!(
  params.fetch_typed(:nonexistence, TA[T.nilable(String)].new, nil),
  T.nilable(String),
)
T.assert_type!(
  params.fetch_typed(:nonexistence, TA[T::Array[Integer]].new, []),
  T::Array[Integer],
)
