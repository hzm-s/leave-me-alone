require 'rails_helper'

xdescribe 'Sign up with google' do
  it do
    post '/sign_up/google'

    follow_redirect!

    expect(response.body).to include('グーグルユーザー')
    expect(response.body).to include('http://avatar.url')
  end
end
