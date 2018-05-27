module RequestSupport
  def follow_turbolinks_visit!
    link = response.body[/visit\(\"(.*?)\"/, 1]
    get link
  end
end

RSpec.configure do |c|
  c.include RequestSupport, type: :request
end
