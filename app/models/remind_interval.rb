class RemindInterval < Struct.new(:minutes)
  unless defined?(ALL)
    ALL = 5.step(60, 5).map { |min| [min.to_s, new(min).freeze] }.to_h
  end

  class << self
    def all
      ALL.values
    end

    def default
      ALL['30']
    end

    def from_integer(i)
      raise ArgumentError unless all.map(&:minutes).include?(i.to_i)
      new(i)
    end
    alias_method :from_minutes, :from_integer
  end

  def to_i
    minutes
  end
end
