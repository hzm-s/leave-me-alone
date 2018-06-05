class RemindInterval < Struct.new(:minutes)
  VALUES = 5.step(60, 5).map { |m| self.new(m) }

  class << self
    def all
      VALUES
    end
  end
end
