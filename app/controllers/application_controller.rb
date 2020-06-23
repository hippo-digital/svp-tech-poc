# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include HomeHelper
  include ActionView::Helpers::SanitizeHelper
  include FormFlowHelper
end
