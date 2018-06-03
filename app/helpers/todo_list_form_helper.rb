module TodoListFormHelper
  mattr_accessor :auto_save_interval

  def todo_list_form_options(instant_mode = false)
    url = if instant_mode
            instant_todo_list_url
          else
            todo_list_url
          end
    build(url)
  end

  private

    def build(url)
      {
        url: url,
        method: :patch,
        scope: :form,
        data: {
          target: 'reminder.subject',
          controller: 'auto-submit',
          auto_submit_interval: TodoListFormHelper.auto_save_interval
        }
      }
    end
end
