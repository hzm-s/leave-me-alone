module TodoListHelper
  mattr_accessor :auto_save_interval

  def todo_list_form_options(is_instant_mode = false)
    {
      url: todo_list_url,
      method: :patch,
      scope: :form,
      data: {
        controller: 'auto-submit',
        auto_submit_interval: TodoListHelper.auto_save_interval,
        target: 'reminder.subject'
      }
    }
  end
end
