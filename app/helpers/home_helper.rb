module HomeHelper
  def user_signed_in?
    session['userinfo'].present?
  end

  def authenticate_user!
    if user_signed_in?
      @current_user = session['userinfo']
    else
      redirect_to root_path
    end
  end

  def userinfo_items
    user_info_details = @current_user.map do |k, v|
      {
          field: k,
          value: v
      }
    end

    user_info_details.compact
  end

  def reset_session
    session['userinfo'] = nil if session['userinfo'].present?
  end
end
