# frozen_string_literal: true

class CheckYourAnswersController < ApplicationController
  def show
    session[:check_answers_seen] = true
    super
  end

  def submit
    # unimplemented...
  end
end
