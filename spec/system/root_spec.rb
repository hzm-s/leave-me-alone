require 'rails_helper'

describe 'Go to root' do
  context 'when NOT signed in' do
    it do
      visit root_url
      expect(page).to have_css('#test-sign-up')
    end
  end

  context 'when signed in' do
    it do
      user = sign_up
      sign_in(user)

      visit root_url

      expect(page).to have_css('#test-remind-at')
    end
  end
end
