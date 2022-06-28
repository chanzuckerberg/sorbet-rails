# typed: true
require 'sorbet-runtime'

wand = Wand.first!
wizard = Wizard.first!
T.assert_type!(wizard, Wizard)

# -- model columns
T.assert_type!(wizard.name, T.nilable(String))

# -- time/date columns
T.assert_type!(wizard.created_at, ActiveSupport::TimeWithZone)
T.assert_type!(wand.broken_at, T.nilable(Time))
T.assert_type!(wand.chosen_at_date, T.nilable(Date))

# assert that TZ aware attributes are casted to TimeWithZone after assigning
wizard.created_at = DateTime.now
T.assert_type!(wizard.created_at, ActiveSupport::TimeWithZone)

T.assert_type!(wand.chosen_at_time, T.nilable(ActiveSupport::TimeWithZone))

# -- model associations
T.assert_type!(wizard.wand, T.nilable(Wand))
T.assert_type!(T.must(wizard.wand).wizard, Wizard)

# need the exact type to works! they aren't subclass of each other
# T.assert_type!(wizard.spell_books, SpellBook::ActiveRecord_Relation)
# T.assert_type!(wizard.spell_books, SpellBook::ActiveRecord_AssociationRelation)
T.assert_type!(wizard.spell_books, SpellBook::ActiveRecord_Associations_CollectionProxy)
T.assert_type!(wizard.spell_book_ids, T::Array[Integer])

# Finder methods -- Model
T.assert_type!(Wizard.exists?(name: 'Test'), T::Boolean)
T.assert_type!(Wizard.find(wizard.id), Wizard)
T.assert_type!(Wizard.take, T.nilable(Wizard))
T.assert_type!(Wizard.take!, Wizard)
T.assert_type!(Wizard.first!, Wizard)
T.assert_type!(Wizard.first, T.nilable(Wizard))
T.assert_type!(Wizard.second!, Wizard)
T.assert_type!(Wizard.second, T.nilable(Wizard))
T.assert_type!(Wizard.third!, Wizard)
T.assert_type!(Wizard.third, T.nilable(Wizard))
T.assert_type!(Wizard.third_to_last!, Wizard)
T.assert_type!(Wizard.third_to_last, T.nilable(Wizard))
T.assert_type!(Wizard.second_to_last!, Wizard)
T.assert_type!(Wizard.second_to_last, T.nilable(Wizard))
T.assert_type!(Wizard.last!, Wizard)
T.assert_type!(Wizard.last, T.nilable(Wizard))
T.assert_type!(Wizard.first_n(5), T::Array[Wizard])
T.assert_type!(Wizard.last_n(5), T::Array[Wizard])
T.assert_type!(Wizard.find_by(name: 'Harry Potter'), T.nilable(Wizard))
T.assert_type!(Wizard.find_by!(name: 'Harry Potter'), Wizard)
T.assert_type!(Wizard.find_by_id(wizard.id), T.nilable(Wizard))
T.assert_type!(Wizard.find_by_id!(wizard.id), Wizard)
T.assert_type!(Wizard.find_or_initialize_by(name: 'Harry Potter') { |w| T.assert_type!(w, Wizard) }, Wizard)
T.assert_type!(Wizard.find_or_create_by(name: 'Harry Potter') { |w| T.assert_type!(w, Wizard) }, Wizard)
T.assert_type!(Wizard.find_or_create_by!(name: 'Harry Potter') { |w| T.assert_type!(w, Wizard) }, Wizard)
T.assert_type!(Wizard.new { |w| T.assert_type!(w, Wizard) }, Wizard)
T.assert_type!(Wizard.create(name: 'Harry Potter') { |w| T.assert_type!(w, Wizard) }, Wizard)
T.assert_type!(Wizard.create!(name: 'Harry Potter') { |w| T.assert_type!(w, Wizard) }, Wizard)
T.assert_type!(Wizard.first_or_create(name: 'Harry Potter') { |w| T.assert_type!(w, Wizard) }, Wizard)
T.assert_type!(Wizard.first_or_create!(name: 'Harry Potter') { |w| T.assert_type!(w, Wizard) }, Wizard)
T.assert_type!(Wizard.first_or_initialize { |w| T.assert_type!(w, Wizard) }, Wizard)
Wizard.find_each { |w| T.assert_type!(w, Wizard) }
T.assert_type!(Wizard.find_each, T::Enumerator[Wizard])
Wizard.find_in_batches { |w| T.assert_type!(w, T::Array[Wizard]) }
T.assert_type!(Wizard.find_in_batches, T::Enumerator[T::Array[Wizard]])
Wizard.in_batches { |w| T.assert_type!(w, Wizard::ActiveRecord_Relation) }
T.assert_type!(Wizard.in_batches, ActiveRecord::Batches::BatchEnumerator)
# T.assert_type!(Wizard.destroy_all, T::Array[Wizard]) # Ignored until we add support
T.assert_type!(Wizard.any?, T::Boolean)
T.assert_type!(Wizard.many?, T::Boolean)
T.assert_type!(Wizard.none?, T::Boolean)
T.assert_type!(Wizard.one?, T::Boolean)
# T.assert_type!(Wizard.update_all(name: 'Harry Potter'), Integer) # Ignored until we add support
# T.assert_type!(Wizard.delete_all, Integer) # Ignored until we add support
# Query methods
T.assert_type!(Wizard.all, Wizard::ActiveRecord_Relation)
T.assert_type!(Wizard.recent, Wizard::ActiveRecord_Relation) # Named scope
T.assert_type!(Wizard.Gryffindor, Wizard::ActiveRecord_Relation) # Enum scope
T.assert_type!(Wizard.Gryffindor.recent, Wizard::ActiveRecord_Relation)
T.assert_type!(Wizard.Gryffindor.recent.unscoped, Wizard::ActiveRecord_Relation)
T.assert_type!(Wizard.where(id: 1), Wizard::ActiveRecord_Relation)
T.assert_type!(Wizard.where(id: 1).recent, Wizard::ActiveRecord_Relation)
T.assert_type!(Wizard.where.not(id: 1), Wizard::ActiveRecord_Relation)
T.assert_type!(Wizard.preload(:spell_books), Wizard::ActiveRecord_Relation)
T.assert_type!(Wizard.eager_load(:spell_books), Wizard::ActiveRecord_Relation)
T.assert_type!(Wizard.order(:id), Wizard::ActiveRecord_Relation)
T.assert_type!(Wizard.select { |r| r.id == 1 }, T::Array[Wizard])
T.assert_type!(Wizard.select_columns(:id, :name), Wizard::ActiveRecord_Relation)
T.assert_type!(Wizard.where_missing(:wand), Wizard::ActiveRecord_Relation)

# Finder methods -- ActiveRecord::Relation
T.assert_type!(Wizard.all.exists?(name: 'Harry Potter'), T::Boolean)
T.assert_type!(Wizard.all.find(wizard.id), Wizard)
T.assert_type!(Wizard.all.take, T.nilable(Wizard))
T.assert_type!(Wizard.all.take!, Wizard)
T.assert_type!(Wizard.all.first!, Wizard)
T.assert_type!(Wizard.all.first, T.nilable(Wizard))
T.assert_type!(Wizard.all.second!, Wizard)
T.assert_type!(Wizard.all.second, T.nilable(Wizard))
T.assert_type!(Wizard.all.third!, Wizard)
T.assert_type!(Wizard.all.third, T.nilable(Wizard))
T.assert_type!(Wizard.all.third_to_last!, Wizard)
T.assert_type!(Wizard.all.third_to_last, T.nilable(Wizard))
T.assert_type!(Wizard.all.second_to_last!, Wizard)
T.assert_type!(Wizard.all.second_to_last, T.nilable(Wizard))
T.assert_type!(Wizard.all.last!, Wizard)
T.assert_type!(Wizard.all.last, T.nilable(Wizard))
T.assert_type!(Wizard.all.first_n(5), T::Array[Wizard])
T.assert_type!(Wizard.all.last_n(5), T::Array[Wizard])
T.assert_type!(Wizard.all.find_by(name: 'Harry Potter'), T.nilable(Wizard))
T.assert_type!(Wizard.all.find_by!(name: 'Harry Potter'), Wizard)
T.assert_type!(Wizard.all.find_by_id(wizard.id), T.nilable(Wizard))
T.assert_type!(Wizard.all.find_by_id!(wizard.id), Wizard)
T.assert_type!(Wizard.all.find_or_initialize_by(name: 'Harry Potter') { |w| T.assert_type!(w, Wizard) }, Wizard)
T.assert_type!(Wizard.all.find_or_create_by(name: 'Harry Potter') { |w| T.assert_type!(w, Wizard) }, Wizard)
T.assert_type!(Wizard.all.find_or_create_by!(name: 'Harry Potter') { |w| T.assert_type!(w, Wizard) }, Wizard)
T.assert_type!(Wizard.all.new { |w| T.assert_type!(w, Wizard) }, Wizard)
T.assert_type!(Wizard.all.build { |w| T.assert_type!(w, Wizard) }, Wizard)
T.assert_type!(Wizard.all.create(name: 'Harry Potter') { |w| T.assert_type!(w, Wizard) }, Wizard)
T.assert_type!(Wizard.all.create!(name: 'Harry Potter') { |w| T.assert_type!(w, Wizard) }, Wizard)
T.assert_type!(Wizard.all.first_or_create(name: 'Harry Potter') { |w| T.assert_type!(w, Wizard) }, Wizard)
T.assert_type!(Wizard.all.first_or_create!(name: 'Harry Potter') { |w| T.assert_type!(w, Wizard) }, Wizard)
T.assert_type!(Wizard.all.first_or_initialize { |w| T.assert_type!(w, Wizard) }, Wizard)
Wizard.all.find_each { |w| T.assert_type!(w, Wizard) }
T.assert_type!(Wizard.all.find_each, T::Enumerator[Wizard])
Wizard.all.find_in_batches { |w| T.assert_type!(w, T::Array[Wizard]) }
T.assert_type!(Wizard.all.find_in_batches, T::Enumerator[T::Array[Wizard]])
Wizard.all.in_batches { |w| T.assert_type!(w, Wizard::ActiveRecord_Relation) }
T.assert_type!(Wizard.all.in_batches, ActiveRecord::Batches::BatchEnumerator)
# T.assert_type!(Wizard.all.destroy_all, T::Array[Wizard]) # Ignored until we add support
T.assert_type!(Wizard.all.any?, T::Boolean)
T.assert_type!(Wizard.all.many?, T::Boolean)
T.assert_type!(Wizard.all.none?, T::Boolean)
T.assert_type!(Wizard.all.one?, T::Boolean)
T.assert_type!(Wizard.all.any? { |r| r.id > 1 }, T::Boolean)
T.assert_type!(Wizard.all.many? { |r| r.id > 1 }, T::Boolean)
T.assert_type!(Wizard.all.none? { |r| r.id > 1 }, T::Boolean)
T.assert_type!(Wizard.all.one? { |r| r.id > 1 }, T::Boolean)

# T.assert_type!(Wizard.all.update_all(name: 'Harry Potter'), Integer) # Ignored until we add support
# T.assert_type!(Wizard.all.delete_all, Integer) # Ignored until we add support
# Query methods
T.assert_type!(Wizard.all.all, Wizard::ActiveRecord_Relation)
T.assert_type!(Wizard.all.recent, Wizard::ActiveRecord_Relation) # Named scope
T.assert_type!(Wizard.all.Gryffindor, Wizard::ActiveRecord_Relation) # Enum scope
T.assert_type!(Wizard.all.Gryffindor.recent, Wizard::ActiveRecord_Relation)
T.assert_type!(Wizard.all.Gryffindor.recent.unscoped, Wizard::ActiveRecord_Relation)
T.assert_type!(Wizard.all.where(id: 1), Wizard::ActiveRecord_Relation)
T.assert_type!(Wizard.all.where(id: 1).recent, Wizard::ActiveRecord_Relation)
T.assert_type!(Wizard.all.where.not(id: 1), Wizard::ActiveRecord_Relation)
T.assert_type!(Wizard.all.preload(:spell_books), Wizard::ActiveRecord_Relation)
T.assert_type!(Wizard.all.eager_load(:spell_books), Wizard::ActiveRecord_Relation)
T.assert_type!(Wizard.all.order(:id), Wizard::ActiveRecord_Relation)
T.assert_type!(Wizard.all.select { |r| r.id == 1 }, T::Array[Wizard])
T.assert_type!(Wizard.all.select_columns(:id, :name), Wizard::ActiveRecord_Relation)
T.assert_type!(Wizard.all.where_missing(:wand), Wizard::ActiveRecord_Relation)
# Enumerable methods
Wizard.all.each { |w| T.assert_type!(w, Wizard) }
Wizard.all.map { |w| T.assert_type!(w, Wizard) }
T.assert_type!(Wizard.all.to_a, T::Array[Wizard])
T.assert_type!(Wizard.all.empty?, T::Boolean)

# Finder methods -- CollectionProxy
spell_book = wizard.spell_books.first!
spell_books = wizard.spell_books
T.assert_type!(spell_books.exists?(name: 'Fantastic Beasts'), T::Boolean)
T.assert_type!(spell_books.find(spell_book.id), SpellBook)
T.assert_type!(spell_books.take, T.nilable(SpellBook))
T.assert_type!(spell_books.take!, SpellBook)
T.assert_type!(spell_books.first!, SpellBook)
T.assert_type!(spell_books.first, T.nilable(SpellBook))
T.assert_type!(spell_books.second!, SpellBook)
T.assert_type!(spell_books.second, T.nilable(SpellBook))
T.assert_type!(spell_books.third!, SpellBook)
T.assert_type!(spell_books.third, T.nilable(SpellBook))
T.assert_type!(spell_books.third_to_last!, SpellBook)
T.assert_type!(spell_books.third_to_last, T.nilable(SpellBook))
T.assert_type!(spell_books.second_to_last!, SpellBook)
T.assert_type!(spell_books.second_to_last, T.nilable(SpellBook))
T.assert_type!(spell_books.last!, SpellBook)
T.assert_type!(spell_books.last, T.nilable(SpellBook))
T.assert_type!(spell_books.first_n(5), T::Array[SpellBook])
T.assert_type!(spell_books.last_n(5), T::Array[SpellBook])
T.assert_type!(spell_books.find_by(name: 'Fantastic Beasts'), T.nilable(SpellBook))
T.assert_type!(spell_books.find_by!(name: 'Fantastic Beasts'), SpellBook)
T.assert_type!(spell_books.find_by_id(spell_book.id), T.nilable(SpellBook))
T.assert_type!(spell_books.find_by_id!(spell_book.id), SpellBook)
T.assert_type!(spell_books.find_or_initialize_by(name: 'Fantastic Beasts') { |s| T.assert_type!(s, SpellBook) }, SpellBook)
T.assert_type!(spell_books.find_or_create_by(name: 'Fantastic Beasts') { |s| T.assert_type!(s, SpellBook) }, SpellBook)
T.assert_type!(spell_books.find_or_create_by!(name: 'Fantastic Beasts') { |s| T.assert_type!(s, SpellBook) }, SpellBook)
T.assert_type!(spell_books.new { |s| T.assert_type!(s, SpellBook) }, SpellBook)
T.assert_type!(spell_books.build { |s| T.assert_type!(s, SpellBook) }, SpellBook)
T.assert_type!(spell_books.create(name: 'Fantastic Beasts') { |s| T.assert_type!(s, SpellBook) }, SpellBook)
T.assert_type!(spell_books.create!(name: 'Fantastic Beasts') { |s| T.assert_type!(s, SpellBook) }, SpellBook)
T.assert_type!(spell_books.first_or_create(name: 'Fantastic Beasts') { |s| T.assert_type!(s, SpellBook) }, SpellBook)
T.assert_type!(spell_books.first_or_create!(name: 'Fantastic Beasts') { |s| T.assert_type!(s, SpellBook) }, SpellBook)
T.assert_type!(spell_books.first_or_initialize { |s| T.assert_type!(s, SpellBook) }, SpellBook)
spell_books.find_each { |s| T.assert_type!(s, SpellBook) }
T.assert_type!(spell_books.find_each, T::Enumerator[SpellBook])
spell_books.find_in_batches { |s| T.assert_type!(s, T::Array[SpellBook]) }
T.assert_type!(spell_books.find_in_batches, T::Enumerator[T::Array[SpellBook]])
spell_books.in_batches { |s| T.assert_type!(s, SpellBook::ActiveRecord_AssociationRelation) }
T.assert_type!(spell_books.in_batches, ActiveRecord::Batches::BatchEnumerator)
# T.assert_type!(spell_books.destroy_all, T::Array[SpellBook]) # Ignored until we add support
T.assert_type!(spell_books.any?, T::Boolean)
T.assert_type!(spell_books.many?, T::Boolean)
T.assert_type!(spell_books.none?, T::Boolean)
T.assert_type!(spell_books.one?, T::Boolean)
T.assert_type!(spell_books.any? { |r| r.id > 1 }, T::Boolean)
T.assert_type!(spell_books.many? { |r| r.id > 1 }, T::Boolean)
T.assert_type!(spell_books.none? { |r| r.id > 1 }, T::Boolean)
T.assert_type!(spell_books.one? { |r| r.id > 1 }, T::Boolean)
# T.assert_type!(spell_books.update_all(name: 'Fantastic Beasts'), Integer) # Ignored until we add support
# T.assert_type!(spell_books.delete_all, Integer) # Ignored until we add support
# Query methods
T.assert_type!(spell_books.all, SpellBook::ActiveRecord_AssociationRelation)
T.assert_type!(spell_books.recent, SpellBook::ActiveRecord_AssociationRelation) # Named scope
T.assert_type!(spell_books.unclassified, SpellBook::ActiveRecord_AssociationRelation) # Enum scope
T.assert_type!(spell_books.unclassified.recent, SpellBook::ActiveRecord_AssociationRelation)
T.assert_type!(spell_books.unclassified.recent.unscoped, SpellBook::ActiveRecord_Relation) # Turns back into relation
T.assert_type!(spell_books.where(id: 1), SpellBook::ActiveRecord_AssociationRelation)
T.assert_type!(spell_books.where(id: 1).recent, SpellBook::ActiveRecord_AssociationRelation)
T.assert_type!(spell_books.where.not(id: 1), SpellBook::ActiveRecord_AssociationRelation)
T.assert_type!(spell_books.preload(:wizard), SpellBook::ActiveRecord_AssociationRelation)
T.assert_type!(spell_books.eager_load(:wizard), SpellBook::ActiveRecord_AssociationRelation)
T.assert_type!(spell_books.order(:id), SpellBook::ActiveRecord_AssociationRelation)
T.assert_type!(spell_books.select { |r| r.id == 1 }, T::Array[SpellBook])
T.assert_type!(spell_books.select_columns(:id, :name), SpellBook::ActiveRecord_AssociationRelation)
T.assert_type!(spell_books.where_missing(:wizard), SpellBook::ActiveRecord_AssociationRelation)

# Enumerable methods
spell_books.each { |s| T.assert_type!(s, SpellBook) }
spell_books.map { |s| T.assert_type!(s, SpellBook) }
T.assert_type!(spell_books.to_a, T::Array[SpellBook])
T.assert_type!(spell_books.empty?, T::Boolean)
# Push methods
T.assert_type!(spell_books << spell_book, SpellBook::ActiveRecord_Associations_CollectionProxy)
T.assert_type!(spell_books << [spell_book], SpellBook::ActiveRecord_Associations_CollectionProxy)
T.assert_type!(spell_books.append(spell_book), SpellBook::ActiveRecord_Associations_CollectionProxy)
T.assert_type!(spell_books.append([spell_book]), SpellBook::ActiveRecord_Associations_CollectionProxy)
T.assert_type!(spell_books.push(spell_book), SpellBook::ActiveRecord_Associations_CollectionProxy)
T.assert_type!(spell_books.push([spell_book]), SpellBook::ActiveRecord_Associations_CollectionProxy)
# T.assert_type!(spell_books.concat(spell_book), SpellBook::ActiveRecord_Associations_CollectionProxy) # TODO: In Rails 5.0 and 5.1 this actually returns T::Array
# T.assert_type!(spell_books.concat([spell_book]), SpellBook::ActiveRecord_Associations_CollectionProxy) # TODO: In Rails 5.0 and 5.1 this actually returns T::Array

# finder methods -- AssociationRelation
spell_books_query = spell_books.where(wizard_id: wizard.id)
T.assert_type!(spell_books_query.exists?(name: 'Fantastic Beasts'), T::Boolean)
T.assert_type!(spell_books_query.find(spell_book.id), SpellBook)
T.assert_type!(spell_books_query.take, T.nilable(SpellBook))
T.assert_type!(spell_books_query.take!, SpellBook)
T.assert_type!(spell_books_query.first!, SpellBook)
T.assert_type!(spell_books_query.first, T.nilable(SpellBook))
T.assert_type!(spell_books_query.second!, SpellBook)
T.assert_type!(spell_books_query.second, T.nilable(SpellBook))
T.assert_type!(spell_books_query.third!, SpellBook)
T.assert_type!(spell_books_query.third, T.nilable(SpellBook))
T.assert_type!(spell_books_query.third_to_last!, SpellBook)
T.assert_type!(spell_books_query.third_to_last, T.nilable(SpellBook))
T.assert_type!(spell_books_query.second_to_last!, SpellBook)
T.assert_type!(spell_books_query.second_to_last, T.nilable(SpellBook))
T.assert_type!(spell_books_query.last!, SpellBook)
T.assert_type!(spell_books_query.last, T.nilable(SpellBook))
T.assert_type!(spell_books_query.first_n(5), T::Array[SpellBook])
T.assert_type!(spell_books_query.last_n(5), T::Array[SpellBook])
T.assert_type!(spell_books_query.find_by(name: 'Fantastic Beasts'), T.nilable(SpellBook))
T.assert_type!(spell_books_query.find_by!(name: 'Fantastic Beasts'), SpellBook)
T.assert_type!(spell_books_query.find_by_id(spell_book.id), T.nilable(SpellBook))
T.assert_type!(spell_books_query.find_by_id!(spell_book.id), SpellBook)
T.assert_type!(spell_books_query.find_or_initialize_by(name: 'Fantastic Beasts') { |s| T.assert_type!(s, SpellBook) }, SpellBook)
T.assert_type!(spell_books_query.find_or_create_by(name: 'Fantastic Beasts') { |s| T.assert_type!(s, SpellBook) }, SpellBook)
T.assert_type!(spell_books_query.find_or_create_by!(name: 'Fantastic Beasts') { |s| T.assert_type!(s, SpellBook) }, SpellBook)
T.assert_type!(spell_books_query.new { |s| T.assert_type!(s, SpellBook) }, SpellBook) # Ignored until we add support
T.assert_type!(spell_books_query.build { |s| T.assert_type!(s, SpellBook) }, SpellBook) # Ignored until we add support # Ignored until we add support
T.assert_type!(spell_books_query.create(name: 'Fantastic Beasts') { |s| T.assert_type!(s, SpellBook) }, SpellBook) # Ignored until we add support
T.assert_type!(spell_books_query.create!(name: 'Fantastic Beasts') { |s| T.assert_type!(s, SpellBook) }, SpellBook) # Ignored until we add support
T.assert_type!(spell_books_query.first_or_create(name: 'Fantastic Beasts') { |s| T.assert_type!(s, SpellBook) }, SpellBook) # Ignored until we add support
T.assert_type!(spell_books_query.first_or_create!(name: 'Fantastic Beasts') { |s| T.assert_type!(s, SpellBook) }, SpellBook) # Ignored until we add support
T.assert_type!(spell_books_query.first_or_initialize { |s| T.assert_type!(s, SpellBook) }, SpellBook) # Ignored until we add support
spell_books_query.find_each { |s| T.assert_type!(s, SpellBook) }
T.assert_type!(spell_books_query.find_each, T::Enumerator[SpellBook])
spell_books_query.find_in_batches { |s| T.assert_type!(s, T::Array[SpellBook]) }
T.assert_type!(spell_books_query.find_in_batches, T::Enumerator[T::Array[SpellBook]])
spell_books_query.in_batches { |s| T.assert_type!(s, SpellBook::ActiveRecord_AssociationRelation) }
T.assert_type!(spell_books_query.in_batches, ActiveRecord::Batches::BatchEnumerator)
# T.assert_type!(spell_books_query.destroy_all, T::Array[SpellBook]) # Ignored until we add support
T.assert_type!(spell_books_query.any?, T::Boolean)
T.assert_type!(spell_books_query.many?, T::Boolean)
T.assert_type!(spell_books_query.none?, T::Boolean)
T.assert_type!(spell_books_query.one?, T::Boolean)
T.assert_type!(spell_books_query.any? { |r| r.id > 1 }, T::Boolean)
T.assert_type!(spell_books_query.many? { |r| r.id > 1 }, T::Boolean)
T.assert_type!(spell_books_query.none? { |r| r.id > 1 }, T::Boolean)
T.assert_type!(spell_books_query.one? { |r| r.id > 1 }, T::Boolean)
# T.assert_type!(spell_books_query.update_all(name: 'Fantastic Beasts'), Integer) # Ignored until we add support
# T.assert_type!(spell_books_query.delete_all, Integer) # Ignored until we add support
# Query methods
T.assert_type!(spell_books_query.all, SpellBook::ActiveRecord_AssociationRelation)
T.assert_type!(spell_books_query.recent, SpellBook::ActiveRecord_AssociationRelation) # Named scope
T.assert_type!(spell_books_query.unclassified, SpellBook::ActiveRecord_AssociationRelation) # Enum scope
T.assert_type!(spell_books_query.unclassified.recent, SpellBook::ActiveRecord_AssociationRelation)
T.assert_type!(spell_books_query.unclassified.recent.unscoped, SpellBook::ActiveRecord_Relation) # Turns back into relation
T.assert_type!(spell_books_query.where(id: 1), SpellBook::ActiveRecord_AssociationRelation)
T.assert_type!(spell_books_query.where(id: 1).recent, SpellBook::ActiveRecord_AssociationRelation)
T.assert_type!(spell_books_query.where.not(id: 1), SpellBook::ActiveRecord_AssociationRelation)
T.assert_type!(spell_books_query.preload(:wizard), SpellBook::ActiveRecord_AssociationRelation)
T.assert_type!(spell_books_query.eager_load(:wizard), SpellBook::ActiveRecord_AssociationRelation)
T.assert_type!(spell_books_query.order(:id), SpellBook::ActiveRecord_AssociationRelation)
T.assert_type!(spell_books.select { |r| r.id == 1 }, T::Array[SpellBook])
T.assert_type!(spell_books.select_columns(:id, :name), SpellBook::ActiveRecord_AssociationRelation)
# Enumerable methods
spell_books_query.each { |s| T.assert_type!(s, SpellBook) }
spell_books_query.map { |s| T.assert_type!(s, SpellBook) }
T.assert_type!(spell_books_query.to_a, T::Array[SpellBook])
T.assert_type!(spell_books_query.empty?, T::Boolean)

# Model columns
T.assert_type!(wizard.id, Integer)
T.assert_type!(wizard.id?, T::Boolean)
T.assert_type!(wizard.notes, T.nilable(String))

# Model enum
T.assert_type!(wizard.Gryffindor?, T::Boolean)
T.assert_type!(Wizard.houses, T::Hash[T.any(String, Symbol), Integer])
T.assert_type!(Wizard.brooms, T::Hash[T.any(String, Symbol), String])
T.assert_type!(spell_book.biology?, T::Boolean)
T.assert_type!(spell_book.book_type, String)
T.assert_type!(SpellBook.book_types, T::Hash[T.any(String, Symbol), Integer])
# Model T::Enum
T.assert_type!(wizard.typed_house, T.nilable(Wizard::House))
T.assert_type!(wizard.typed_broom, T.nilable(Wizard::Broom))
T.assert_type!(wizard.typed_quidditch_position, T.nilable(Wizard::QuidditchPosition))
T.assert_type!(Wizard::House, T.class_of(T::Enum))
T.assert_type!(Wizard::House::Gryffindor, Wizard::House)
T.assert_type!(Wizard::House::Hufflepuff, Wizard::House)
T.assert_type!(Wizard::House::Ravenclaw, Wizard::House)
T.assert_type!(Wizard::House::Slytherin, Wizard::House)

# Serialization
T.assert_type!(
  wizard.owl_results,
  T.nilable(T::Hash[T.untyped, T.untyped])
)
T.assert_type!(
  wizard.newt_subjects,
  T.nilable(T.any(T::Array[T.untyped], T::Boolean, Float, T::Hash[T.untyped, T.untyped], Integer, String))
)
T.assert_type!(
  wizard.patronus_characteristics,
  T.nilable(ActiveRecord::Coders::JSON),
)
T.assert_type!(wizard.pets, T.nilable(T::Array[T.untyped]))

# Mythical plugin
T.assert_type!(Wand.mythicals, T::Array[Wand])

# Mailers
T.assert_type!(HogwartsAcceptanceMailer.notify(wizard), ActionMailer::MessageDelivery)

# Jobs
T.assert_type!(
  AwardHousePointHourglasses.perform_later(student: wizard, point: 10),
  AwardHousePointHourglasses
)
AwardHousePointHourglasses.perform_now(student: wizard, point: 10)
AwardHousePointHourglasses.
  set(queue: :daily, wait: 5.minutes).
  perform_later(student: wizard, point: 10)
AwardHousePointHourglasses.
  set(priority: 10, wait_until: Time.now.tomorrow).
  perform_later(student: wizard, point: 10)

T.assert_type!(wizard.broom_nimbus?, T::Boolean)
T.assert_type!(wizard.color_brown_eyes?, T::Boolean)
T.assert_type!(wizard.quidditch_keeper?, T::Boolean)
T.assert_type!(wizard.brown_hair?, T::Boolean)

# Relations
T.assert_type!(wizard.spell_books.any?, T::Boolean)
T.assert_type!(wizard.spell_books.none?, T::Boolean)
T.assert_type!(wizard.spell_books.one?, T::Boolean)

# -- Custom ActionController::Parameters Methods
class MyActionParams < T::Struct
  class Info < T::Struct
    const :birthday, Date
    const :friends, T::Array[String]
    const :grandson, T.nilable(String)
  end

  const :age, Integer
  const :name, String
  const :info, Info
end

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

typed_params = TypedParams[MyActionParams].new.extract!(params)
T.assert_type!(typed_params, MyActionParams)

# -- pluck to tstruct
class WizardStruct < T::Struct
  const :name, String
  const :house, T.nilable(String)
end

T.assert_type!(Wizard.pluck_to_tstruct(TA[WizardStruct].new), T::Array[WizardStruct])
T.assert_type!(Wizard.all.pluck_to_tstruct(TA[WizardStruct].new), T::Array[WizardStruct])

Wizard.pluck_to_tstruct(TA[WizardStruct].new).each do |row|
  T.assert_type!(row, WizardStruct)
end
Wizard.all.pluck_to_tstruct(TA[WizardStruct].new).each do |row|
  T.assert_type!(row, WizardStruct)
end

# -- GeneratedUrlHelpers
class TestHelper
  include GeneratedUrlHelpers
end

T.assert_type!(TestHelper.new.test_index_path, String)
# need to set this config for _url methods
Rails.application.routes.default_url_options = {
  protocol: 'http',
  host: 'localhost',
  port: 3000,
}
T.assert_type!(TestHelper.new.test_index_url, String)
