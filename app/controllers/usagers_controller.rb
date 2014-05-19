class UsagersController < ApplicationController
  
  def show
    @usager = Usager.find(params[:id])
  end
  
  def new
    @usager = Usager.new
  end
  
  def create
    @usager = Usager.new(user_params)
    if @usager.save
      flash[:success] = "Bienvenue a mon Epicerie!"
      redirect_to @usager
    else
      render 'new'
    end
  end
  
  private
    def user_params
      params.require(:usager).permit(:name, :email, :password, :password_confirmation)
    end
end
