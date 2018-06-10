class SettingsController < ApplicationController
  layout 'app'

  def show
    setting = current_user.reminder_setting
    @form = SettingForm.new(remind_interval: setting.interval.to_i)
  end

  def update
    form = SettingForm.new(form_params)
    form.validate

    setting = ReminderSetting.new(interval: form.domain_objects[:remind_interval])
    current_user.reminder_setting = setting

    if current_user.save
      redirect_to setting_url, notice: '設定を保存しました'
    end
  end

  private

    def form_params
      params.require(:form).permit(:remind_interval)
    end
end
