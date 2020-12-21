module TStructComparable
  def ==(other)
    return false unless other.is_a?(self.class)

    self.class.props.keys.each do |prop|
      self.send(prop) == other.send(prop)
    end
  end

  def eql?(other)
    self == other
  end
end
