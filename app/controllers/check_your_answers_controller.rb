# frozen_string_literal: true

class CheckYourAnswersController < ApplicationController
  def show
    session[:check_answers_seen] = true
    super
  end

  def submit
    pp session.to_h
    pp sanitised_session.to_h

    FormResponse.create(
      ReferenceId: reference_number,
      NHSSub: session['nhs_sub'],
      UnixTimestamp: Time.zone.now,
      FormResponse: sanitised_session
    )

    redirect_to '/'
  end

  def session_with_indifferent_access
    session.to_h.with_indifferent_access
  end

  def sanitised_session
    session_with_indifferent_access.except(
      :session_id, :_csrf_token, :current_path, :previous_path, :check_answers_seen, :nhs_sub, :saved_answer
    )
  end

  def reference_number
    timestamp = Time.zone.now.strftime('%Y%m%d-%H%M%S')
    random_id = SecureRandom.hex(3).upcase
    "#{timestamp}-#{random_id}"
  end
end
