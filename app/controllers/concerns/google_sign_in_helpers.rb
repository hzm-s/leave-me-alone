module GoogleSignInHelpers
  private

    def google_identity
      @__google_identity ||= GoogleSignIn::Identity.new(params[:google_id_token])
    end

    def require_google_id_token
      if params[:google_id_token].blank?
        flash_via_js notice: 'もう一度お試しください'
      end
    end
end
