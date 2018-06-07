class SettingsController < ApplicationController
  layout 'app'

  def show
    setting = current_user.reminder_setting
    @form = SettingForm.new(reminder_interval_i: setting.interval.minutes)
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
      params.require(:form).permit(:reminder_interval_i)
    end
end
