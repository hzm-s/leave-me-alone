require 'rails_helper'

describe 'Reset todo list', system: true, js: true do
  let!(:user) { sign_up }

  before do
    todo_list = user.todo_list
    todo_list.tap do |list|
      list.add(content: 'Alpha', done: true)
      list.add(content: 'Bravo', done: true)
      list.add(content: 'Charlie')
      list.save!
    end


    sign_in(user)
    visit todo_list_path
  end

  it do
    find('#test-header').hover
    find('#js-TodoList_Menu').click
    click_on '完了したTodoをすべて削除'

    aggregate_failures do
      expect(page).to_not have_content('Alpha')
      expect(page).to_not have_content('Bravo')
      expect(page).to have_content('Charlie')
    end
  end
end
