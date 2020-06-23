class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:user_details]

  def index
  end

  def user_details
  end
end
