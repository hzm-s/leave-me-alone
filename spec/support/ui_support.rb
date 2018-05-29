module UISupport
  module System
    include TodoListHelper

    def edit_todo_list_title(title)
      find('#test-header').hover
      click_on '編集する'
      fill_in 'form[title]', with: title
      click_button
    end

    def edit_todo(index, content)
      all('.test-list-item')[index].hover
      click_on '編集する'
      fill_in "form[todos][#{index}][content]", with: content
      click_button
    end

    def add_todo(content)
      find('#test-new-todo-content').set(content)
      find('#test-create-todo').click
    end

    def remove_todo(index)
      all('.test-list-item')[index].hover
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

    def wait_for_todo_list_save
      yield
      wait_sec = (TodoListHelper.auto_save_interval + 300) / 1000.0
      sleep wait_sec
      visit todo_list_path
    end
  end
end

RSpec.configure do |c|
  c.include UISupport::System, type: :system
end
