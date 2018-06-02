require 'rails_helper'

describe 'Reset todo list', system: true, js: true do
  let!(:user) { sign_up }

  before do
    todo_list = TodoList.find_by_user_id(user.id)
    todo_list.tap do |list|
      list.add(content: 'Alpha', done: true)
      list.add(content: 'Bravo', done: true)
      list.add(content: 'Charlie')
      list.save!
    end


    sign_in(user)
    visit todo_list_path
  end

  describe 'Only done' do
    it do
      remove_dones
      aggregate_failures do
        expect(page).to_not have_content('Alpha')
        expect(page).to_not have_content('Bravo')
        expect(page).to have_content('Charlie')
      end
    end
  end

  describe 'All' do
    it do
      remove_all
      aggregate_failures do
        expect(page).to_not have_content('Alpha')
        expect(page).to_not have_content('Bravo')
        expect(page).to_not have_content('Charlie')
      end
    end
  end
end
