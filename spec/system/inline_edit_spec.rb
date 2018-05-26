require 'rails_helper'

describe 'Inline Edit', type: :system, js: true do
  before do
    TodoList.create
    visit todo_list_path
  end

  describe 'Title' do
    it do
      find('#test-header').hover
      click_on '編集する'
      fill_in 'form[title]', with: 'Yarukoto'
      click_button
      expect(page).to have_content('Yarukoto')
    end
  end
end
