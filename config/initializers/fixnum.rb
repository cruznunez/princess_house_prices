class Fixnum
  def to_dollars
    '$%.2f' % (self/100.0)
  end
end
