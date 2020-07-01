# frozen_string_literal: true

class OidcController < ApplicationController
  def callback
    reset_session
    session[:auto_generated_data] = {
      example_1: 'Lorem ipsum est...',
      example_2: 'Something or other'
    }
    session[:userinfo] = request.env['omniauth.auth'].info
    session[:nhs_sub] = request.env['omniauth.auth']['extra']['raw_info']['sub']
    redirect_to address_url
  end

  def failure; end

  def logout
    reset_session
    redirect_to root_path
  end
end
