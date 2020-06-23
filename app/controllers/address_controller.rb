# frozen_string_literal: true

class AddressController < ApplicationController
  REQUIRED_FIELDS = %i[
    building_and_street_line_1
    town_city
    postcode
  ].freeze

  def submit
    @form_responses = {
      address: {
        building_and_street_line_1: strip_tags(params[:building_and_street_line_1]&.strip).presence,
        building_and_street_line_2: strip_tags(params[:building_and_street_line_2]&.strip).presence,
        town_city: strip_tags(params[:town_city]&.strip).presence,
        county: strip_tags(params[:county]&.strip).presence,
        postcode: strip_tags(params[:postcode]&.gsub(/[[:space:]]+/, '')).presence
      }
    }

    invalid_fields = validate_fields

    if invalid_fields.any?
      flash.now[:validation] = invalid_fields

      respond_to do |format|
        format.html { render controller_path, status: :unprocessable_entity }
      end
    elsif session[:check_answers_seen]
      session[:address] = @form_responses[:address]
      redirect_to check_your_answers_url
    else
      session[:address] = @form_responses[:address]
      redirect_to help_with_food_delivery_url
    end
  end

  private

  def validate_postcode(field, postcode)
    if postcode.blank?
      []
    elsif postcode =~ /^(([A-Z]{1,2}[0-9][A-Z0-9]?|ASCN|STHL|TDCU|BBND|[BFS]IQQ|PCRN|TKCA) ?[0-9][A-Z]{2}|BFPO ?[0-9]{1,4}|(KY[0-9]|MSR|VG|AI)[ -]?[0-9]{4}|[A-Z]{2} ?[0-9]{2}|GE ?CX|GIR ?0A{2}|SAN ?TA1)$/i
      []
    else
      [{ field: field.to_s, text: t('errors.postcode_format') }]
    end
  end

  def validate_fields
    [
      validate_missing_fields,
      validate_postcode('postcode', @form_responses[:address].dig(:postcode))
    ].flatten.uniq
  end

  def validate_missing_fields
    REQUIRED_FIELDS.each_with_object([]) do |field, invalid_fields|
      next if @form_responses[:address].dig(field).present?

      invalid_fields << {
        field: field.to_s,
        text: t("questions.#{controller_name}.#{field}.custom_error",
                default: t('errors.missing_mandatory_text_field',
                           field: t("questions.#{controller_name}.#{field}.label")).humanize)
      }
    end
  end

  def previous_path
    date_of_birth_path
  end
end
