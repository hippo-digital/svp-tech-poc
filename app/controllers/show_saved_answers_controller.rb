# frozen_string_literal: true

class ShowSavedAnswersController < ApplicationController
  def submit
    formresponse = FormResponse.where(
      NHSSub: session['nhs_sub']
    ).first
    formresponse.FormResponse[:help_with_food_delivery][:required] = \
      session[:help_with_food_delivery]['required']
    formresponse.save
    redirect_to saved_successfully_url
  end
end
