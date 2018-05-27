module Flashable
  MESSAGES = {
    not_signed_up: 'ユーザー登録してください',
    retry: 'もう一度ログインしてください',
    already_signed_in: 'ログインしています',
    signed_in: 'ログインしました'
  }.freeze

  def set_flash_message
    return unless params[:flash]
    flash.now[:notice] = MESSAGES[params[:flash].to_sym]
  end
end
