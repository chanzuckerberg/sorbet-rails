# typed: false
module SorbetRails
  module CustomFinderMethods
    def find_n(*ids)
      find(*ids)
    end

    def first_n(n)
      first(n)
    end

    def last_n(n)
      last(n)
    end

    def select_columns(*args)
      select(*args)
    end

    # Redeclare these dynamic methods here otherwise they will be generated by
    # `srb rbi hidden-definitions`
    def find_by_id(id)
      find_by(id: id)
    end

    def find_by_id!(id)
      find_by!(id: id)
    end

    # where.missing is only available in Rails 6.1 and above
    if Rails.version >= "6.1"
      # https://api.rubyonrails.org/v6.1.4/classes/ActiveRecord/QueryMethods/WhereChain.html#method-i-missing
      def where_missing(*args)
        where.missing(*args)
      end
    end
  end
end
