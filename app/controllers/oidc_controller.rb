# frozen_string_literal: true

class OidcController < ApplicationController
  def callback
    reset_session
    sub = request.env['omniauth.auth']['extra']['raw_info']['sub']
    session[:nhs_sub] = sub
    saved_answer = FormResponse.where(NHSSub: sub).first
    if saved_answer
      session[:saved_answer] = true
      session.update(saved_answer.FormResponse)
      redirect_to check_your_answers_url
    else
      session[:saved_answer] = false

      session[:auto_generated_data] = {
        example_1: 'Lorem ipsum est...',
        example_2: 'Something or other'
      }
      session[:userinfo] = request.env['omniauth.auth'].info

      redirect_to address_url
    end
  end

  def failure; end

  def logout
    reset_session
    redirect_to root_path
  end
end
