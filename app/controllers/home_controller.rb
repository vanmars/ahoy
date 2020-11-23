class HomeController < ApplicationController
  def index
  end

  def about
  end

  def contact
  end

  def directions
  end

  def account
    @user = current_user
  end

end
