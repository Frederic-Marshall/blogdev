class Admin::UsersController < Admin::AdminController
  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path, success: 'Категория успешно создана'
    else
      flash[:danger] = 'Категория не создана'
      render :new
    end
  end
  
  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to admin_users_path, success: 'Пользователь обновлен'
    else
      flash.now[:danger] = 'Произошла ошибка'
      render :edit
    end
  end
  
  def destroy
    if @user.present?
      @user.destroy
    end

    redirect_to admin_users_path, success: 'Пользователь удален'
  end

  private

  def user_params
    params.require(:user).permit(:id, :email, :password, :admin, :moderatior, :avatar)
  end

  def set_user
    @user = User.find(params[:id])
  end
end