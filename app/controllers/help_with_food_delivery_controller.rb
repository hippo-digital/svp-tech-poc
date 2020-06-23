# frozen_string_literal: true

class HelpWithFoodDeliveryController < ApplicationController
  def submit
    @form_responses = {
      required: strip_tags(params[:required]).presence
    }
    update_session_store
    redirect_to next_page_url
  end

  def validate_radio_field(page, radio:)
    return false unless radio.blank?

    [{ field: page.to_s,
       text: t(
         "questions.#{page}.custom_select_error",
         default: t('errors.radio_field', field: t("questions.#{page}.title")).humanize
       ) }]
  end

  private

  def update_session_store
    session[:help_with_food_delivery] = {
      required: @form_responses[:required]
    }
  end

  def next_page_url
    check_your_answers_url
  end

  def previous_path
    address_path
  end
end
