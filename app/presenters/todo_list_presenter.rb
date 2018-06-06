class TodoListPresenter < SimpleDelegator

  def initialize(todo_list, reminder_setting: ReminderSetting.default, instant_mode: false)
    super(todo_list)
    @reminder_setting = reminder_setting
    @instant_mode = instant_mode
  end

  def interval_in_minutes
    @reminder_setting.interval.minutes
  end

  def instant_mode?
    @instant_mode
  end
end
