module TodoListHelper
  mattr_accessor :auto_save_interval

  def todo_list_form_options(instant_mode = false)
    return disalbe_auto_save if instant_mode
    enable_auto_save
  end

  private

    def enable_auto_save
      {
        url: todo_list_url,
        method: :patch,
        scope: :form,
        data: {
          target: 'reminder.subject',
          controller: 'auto-submit',
          auto_submit_interval: TodoListHelper.auto_save_interval
        }
      }
    end

    def disalbe_auto_save
      {
        url: '#',
        scope: :form,
        data: {
          target: 'reminder.subject'
        }
      }
    end
end
