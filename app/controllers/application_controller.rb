class ApplicationController < ActionController::Base
  include UserHelpers

  private

    def flash_via_js(options)
      type = options.keys.first
      message = options.values.first
      flash.now[type] = message
      render 'flash'
    end
end
