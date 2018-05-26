module UISupport
  module System

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

    def done(index)
      check "todo-list-item-check-#{index}"
    end

    def revert_done(index)
      uncheck "todo-list-item-check-#{index}"
    end

    def wait_for_todo_list_saved
      sleep 1.2
      visit todo_list_path
    end
  end
end

RSpec.configure do |c|
  c.include UISupport::System, type: :system
end
