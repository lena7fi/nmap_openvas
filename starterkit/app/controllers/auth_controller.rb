class AuthController < ApplicationController

  def initialize
    super
    # Include the main layout bootstrap file
    require_relative "../views/#{Rails.configuration.settings.KT_THEME_LAYOUT_DIR}/_bootstrap/auth"

    # Initialize the main layout bootstrap class
    KTBootstrapDefault.new.init(helpers)
  end

  def signin
    render "pages/auth/signin"
  end

  def signup
    render "pages/auth/signup"
  end

  def reset_password
    render "pages/auth/reset-password"
  end

  def new_password
    render "pages/auth/new-password"
  end
end
