class HorsesController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]

  def index
  end

  def create
    @horse = current_user.horses.build(params[:horse])
    if @horse.save
      flash[:success] = "Horse created!"
      redirect_to root_path
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end
end