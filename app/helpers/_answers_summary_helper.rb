# frozen_string_literal: true

module AnswersSummaryHelper
  def summary_entry(session_path_or_key, description, edit)
    value = session.to_h.dig(*session_path_or_key.is_a?(Array) ? session_path_or_key : [session_path_or_key])

    entry = {
      field: description, value: sanitize(value)
    }
    if edit == true
      entry[:edit] = {
        href: "#{session_path_or_key.first.dasherize}?change-answer"
      }
    end
    entry
  end

  def nhs_user_info_summary
    [
      summary_entry(%w[userinfo email], t('answers_summary.userinfo.email.label'), false),
      summary_entry(%w[userinfo phone_number], t('answers_summary.userinfo.phone_number.label'), false)
    ]
  end

  def form_questions_summary
    [
      summary_entry(%w[address building_and_street_line_1], t('questions.address.building_and_street.label'),
                    !session[:saved_answer]),
      summary_entry(%w[address building_and_street_line_2], t('questions.address.building_and_street.label'),
                    !session[:saved_answer]),
      summary_entry(%w[address town_city], t('questions.address.town_city.label'), !session[:saved_answer]),
      summary_entry(%w[address county], t('questions.address.county.label'), !session[:saved_answer]),
      summary_entry(%w[address postcode], t('questions.address.postcode.label'), !session[:saved_answer]),
      summary_entry(
        %w[help_with_food_delivery required], t('answers_summary.help_with_food_delivery.required.label'), true
      )
    ]
  end

  def auto_generated_data_summary
    [
      summary_entry(
        %w[auto_generated_data example_1], t('answers_summary.auto_generated_data.example_1.label'), false
      ),
      summary_entry(
        %w[auto_generated_data example_2], t('answers_summary.auto_generated_data.example_2.label'), false
      )
    ]
  end
end
