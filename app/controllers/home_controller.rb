class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:user_details]

  def index
    reset_session
  end
end
