class RemindInterval < Struct.new(:minutes)
  class << self
    def all
      5.step(60, 5).map { |m| new(m) }
    end

    def default
      new(30)
    end

    def from_integer(i)
      new(i)
    end
  end

  def to_i
    minutes
  end
end
