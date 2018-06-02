module UISupport
  module System
    include TodoListFormHelper

    def edit_todo_list_title(title)
      find('#test-header').first('span').double_click
      fill_in 'form[title]', with: title
      click_button
    end

    def add_todo(content)
      find('#test-new-todo-content').set(content)
      find('#test-create-todo').click
    end

    def find_todo(index)
      find("[data-todo-list-item-index='#{index}']")
    end

    def edit_todo(index, content)
      find_todo(index).find('label').double_click
      fill_in "form[todos][#{index}][content]", with: content
      click_button
    end

    def remove_todo(index)
      find_todo(index).hover
      click_on '削除する'
    end

    def todos
      all('.test-list-item')
    end

    def todo_checkbox_id(index)
      "todo-list-item-check-#{index}"
    end

    def todo_checkbox(index)
      find("##{todo_checkbox_id(index)}")
    end

    def done(index)
      check todo_checkbox_id(index)
    end

    def revert_done(index)
      uncheck todo_checkbox_id(index)
    end

    def todo_checked(index)
      todo_checkbox(index)[:checked]
    end

    def open_todo_list_menu
      find('#test-header').hover
      find('#js-TodoList_Menu').click
    end

    def remove_dones
      open_todo_list_menu
      click_on '完了したTodoをすべて削除'
    end

    def remove_all
      open_todo_list_menu
      click_on '未完了も含めてTodoをすべて削除'
    end

    def wait_for_todo_list_save(reload: true)
      wait_for_todo_list_save_withouot_reload { yield }
      return unless reload
      visit todo_list_path
    end

    def wait_for_todo_list_save_withouot_reload
      yield
      wait_sec = (TodoListFormHelper.auto_save_interval + 300) / 1000.0
      sleep wait_sec
    end
  end
end

RSpec.configure do |c|
  c.include UISupport::System, type: :system
end
