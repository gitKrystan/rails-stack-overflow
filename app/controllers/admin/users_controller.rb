class Admin::UsersController < AdminController
  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    @users = User.order(:name)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = 'User settings have been updated.'
    end
    render 'edit'
  end

  def destroy
    @user.destroy
    flash[:notice] = 'User has been deleted.'
    redirect_to admin_root_path
  end

  private

  def user_params
    params.require(:user).permit(:admin)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
