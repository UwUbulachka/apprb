class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end
    
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user #Вход пользователя после регистрации
      flash[:success] = "Welcome to the Sample App!" #создания кратковременного сообщения
      redirect_to @user #переадресации на страницу профиля вновь созданного пользователя
      # Обработать успешное сохранение.
    else
    render 'new'  
    end
  end  

  private

  def user_params
   params.require(:user).permit(:name, :email, :password, :password_confirmation) 
  end  
end
