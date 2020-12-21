class HomeController < ApplicationController

  def account
    @user = current_user
  end

end
