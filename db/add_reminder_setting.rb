User.all.each do |user|
  user.reminder_setting = ReminderSetting.default
end
