require 'rails_helper'

describe 'Todoリストの更新', type: :system, js: true do
  before { TodoList.create }

  it do
    visit todo_list_path
    expect(page).to have_content('Todo')
    items = all('.test-list-item')
    expect(items).to be_empty
  end

  it do
    visit todo_list_path
    find('#test-new-todo-content').set('Alpha')
    find('#test-create-todo').click
    find('#test-new-todo-content').set('Bravo')
    find('#test-create-todo').click
    find('#test-new-todo-content').set('Charlie')
    find('#test-create-todo').click
    check 'todo-list-item-check-1'
    wait_auto_save

    visit todo_list_path
    expect(page).to have_content('Alpha')
    expect(page).to have_content('Bravo')
    expect(page).to have_content('Charlie')
    expect(page).to have_checked_field('Bravo')
  end

  it do
    visit todo_list_path
    find('#test-new-todo-content').set('Alpha')
    find('#test-create-todo').click
    check 'todo-list-item-check-0'
    wait_auto_save

    visit todo_list_path
    uncheck 'todo-list-item-check-0'
    wait_auto_save

    visit todo_list_path
    expect(page).to_not have_checked_field('Alpha')
  end

  it do
    visit todo_list_path
    wait_auto_save

    visit todo_list_path
    items = all('.test-list-item')
    expect(items).to be_empty
  end

  private

    def wait_auto_save
      sleep 1.5
    end
end
