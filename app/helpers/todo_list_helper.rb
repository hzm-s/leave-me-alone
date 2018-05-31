module TodoListHelper
  mattr_accessor :auto_save_interval

  def todo_list_form_options(instant_mode = false)
    base = {
      url: todo_list_url,
      method: :patch,
      scope: :form,
      data: {
        target: 'reminder.subject'
      }
    }
    return base if instant_mode
    base.deep_merge(data: {
      controller: 'auto-submit',
      auto_submit_interval: TodoListHelper.auto_save_interval
    })
  end
end
