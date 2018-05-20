require 'rails_helper'

describe 'Todoリストの更新', type: :system, js: true do
  before { TodoList.create }

  it do
    visit todo_list_path
    expect(page).to have_content('Todo')
    items = all('.test-todo-list-item')
    expect(items).to be_empty
  end

  xit do
    visit todo_list_path
    find('#test-new-todo-content').set('Alpha')
    find('#test-create-todo').click
    find('#test-new-todo-content').set('Bravo')
    find('#test-create-todo').click
    find('#test-new-todo-content').set('Charlie')
    find('#test-create-todo').click
    click_on '保存する'

    expect(page).to have_content('Alpha')
    expect(page).to have_content('Bravo')
    expect(page).to have_content('Charlie')
  end
end
