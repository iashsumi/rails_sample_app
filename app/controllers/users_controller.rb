class UsersController < ApplicationController
  def index
    @params = search_params 
    @q = User.ransack(params[:q])
    @users = @q.result.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def new_confirm
    @user = User.new(user_params)
    render :new unless @user.valid?
  end

  def create
    @user = User.new(user_params)
    return render :new unless @user.save

    redirect_to users_path, flash: { success: '登録しました' }
  end

  def edit
    @user = User.find(params[:id])
  end

  def edit_confirm
    @user = User.find(params[:id])
    @user.attributes = user_params
    render :new unless @user.valid?
  end

  def update
    @user = User.find(params[:id])
    @user.attributes = user_params
    return render :edit unless @user.save

    redirect_to users_path, flash: { success: '更新しました' }
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to users_path, flash: { success: '削除しました' }
  end

  def new_all; end

  def import
    User.bulk_insert(params[:file])
    redirect_to users_path, flash: { success: '登録しました' }
  end

  private

  def search_params
    return if params[:q].blank?
    params.require(:q).permit(:name_eq, :birthday_eq, :sex_eq)
  end

  def user_params
    params.require(:user).permit(
      :id,
      :name,
      :birthday,
      :sex,
      :address,
      :email,
      :avatar,
      :avatar_cache
    )
  end
end
