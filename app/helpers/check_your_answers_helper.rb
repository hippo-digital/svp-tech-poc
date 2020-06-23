# frozen_string_literal: true

module CheckYourAnswersHelper
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
    pp session.to_h
    [
      summary_entry(%w[userinfo email], t('check_your_answers.userinfo.email.label'), false),
      summary_entry(%w[userinfo phone_number], t('check_your_answers.userinfo.phone_number.label'), false)
    ]
  end

  def form_questions_summary
    [
      summary_entry(%w[address building_and_street], t('questions.address.building_and_street.label'), true),
      summary_entry(%w[address building_and_street_line_1], t('questions.address.building_and_street.label'), true),
      summary_entry(%w[address town_city], t('questions.address.town_city.label'), true),
      summary_entry(%w[address county], t('questions.address.county.label'), true),
      summary_entry(%w[address postcode], t('questions.address.postcode.label'), true),
      summary_entry(%w[help_with_food_delivery required], t('questions.help_with_food_delivery.required.label'), true)
    ]
  end
end
