class ApplicationCommand
  include ActiveModel::Model
  include Oblate::Result

  def self.run(*args, &block)
    new(*args, &block).run
  end
end
