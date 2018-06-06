class SettingsController < ApplicationController
  layout 'app'

  def show
    setting = current_user.reminder_setting || ReminderSetting.default
    @form = SettingForm.new(interval_in_minutes: setting.interval.minutes)
  end

  def update
    form = SettingForm.new(form_params)

    setting = ReminderSetting.new(interval: form.remind_interval)
    current_user.reminder_setting = setting

    if current_user.save
      redirect_to setting_url, notice: '設定を保存しました'
    end
  end

  private

    def form_params
      params.require(:form).permit(:interval_in_minutes)
    end
end
