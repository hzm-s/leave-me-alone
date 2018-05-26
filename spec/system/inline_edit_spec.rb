require 'rails_helper'

describe 'Inline Edit', type: :system, js: true do
  before do
    TodoList.new(title: 'Todo') do |list|
      list.add(content: 'Item123')
      list.save!
    end

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

  describe 'Todo' do
    it do
      first('.test-list-item').hover
      click_on '編集する'
      fill_in 'form[todos][0][content]', with: 'Item789'
      click_button
      expect(page).to have_content('Item789')
    end
  end
end
