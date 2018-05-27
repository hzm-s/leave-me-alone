class ApplicationCommand
  include Oblate::Result
  include ActiveModel::Model

  def self.run(*args, &block)
    new(*args, &block).run
  end
end
