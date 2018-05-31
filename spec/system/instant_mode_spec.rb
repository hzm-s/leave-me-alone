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
end
