# frozen_string_literal: true

class OidcController < ApplicationController
  def callback
    session[:userinfo] = request.env['omniauth.auth'].info
    redirect_to address_url
  end

  def failure
  end

  def logout
    reset_session
    redirect_to root_path
  end
end
