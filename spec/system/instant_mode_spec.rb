require 'rails_helper'

describe 'Instant mode', type: :system, js: true do
  before do
    visit instant_todo_list_path
  end

  describe 'Edit title' do
    it do
      edit_todo_list_title('Yarukoto')
      expect(page).to have_content('Yarukoto')
    end
  end

  describe 'Add a todo' do
    it do
      add_todo('Alpha')
      expect(page).to have_content('Alpha')
    end
  end

  xdescribe 'Edit a todo' do
    it do
      add_todo('Fox')
      edit_todo(0, 'Foxtrot')
      expect(page).to have_content('Foxtrot')
    end
  end
end
