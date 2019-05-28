module SorbetRails
  module CustomFinderMethods
    def find_n(ids)
      find(ids)
    end

    def first_n(n)
      first(n)
    end

    def last_n(n)
      last(n)
    end
  end
end
