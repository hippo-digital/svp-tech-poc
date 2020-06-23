# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include HomeHelper
  include ActionView::Helpers::SanitizeHelper
  include FormFlowHelper

  helper_method :previous_path

  def show
    @form_responses = session.to_hash.with_indifferent_access
    respond_to do |format|
      format.html { render controller_path }
    end
  end
end
