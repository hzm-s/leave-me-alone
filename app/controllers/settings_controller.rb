class SettingsController < ApplicationController
  layout 'app'

  def show
    form = SettingForm.new
  end

  def update
    form = SettingForm.new(form_params)
    @setting = ReminderSetting.find_by_user_id(user_id: current_user.id)

    if @setting.update(interval_in_minutes: form.interval_in_minutes)
      redirect_to setting_url, notice: '設定を保存しました'
    end
  end

  private

    def form_params
      params.require(:form).permit(:interval_in_minutes)
    end
end
