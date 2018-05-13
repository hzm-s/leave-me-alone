class Todo < String

  def initialize(string)
    raise DomainObjectArgumentError.i18n(:too_short, count: 1) if string.length < 1
    raise DomainObjectArgumentError.i18n(:too_long, count: 30) if string.length > 30
    super
  end
end
