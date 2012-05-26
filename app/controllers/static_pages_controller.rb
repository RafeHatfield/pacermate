class StaticPagesController < ApplicationController
  def home
    @horse = current_user.horses.build if signed_in?
  end

  def help
  end

  def about
  end
  
  def contact
  end
end
