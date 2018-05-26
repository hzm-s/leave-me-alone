module TodoListHelper

  def todo_list_auto_submit_interval
    return 200 if Rails.env.test?
    1000 * 2
  end
end
