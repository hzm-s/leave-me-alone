Rails.application.config.to_prepare do
  TodoListHelper.auto_save_interval =
    if Rails.env.test?
      200
    else
      1000 * 2
    end
end
