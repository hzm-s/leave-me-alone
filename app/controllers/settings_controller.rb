class SettingsController < ApplicationController
  layout 'app'

  def show
    form = SettingForm.new
  end

  def update
    form = SettingForm.new(form_params)
    if result = UpdateReminderSettingCommand.run(form)
      redirect_to setting_url, notice: '設定を保存しました'
    end
  end

  private

    def form_params
      params.require(:form).permit(:interval_in_minutes)
    end
end
