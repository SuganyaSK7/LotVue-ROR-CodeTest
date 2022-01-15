class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def new
  	@user = User.new
  end

  def edit
  	@user = User.find(params[:id])
  end

  def show
  	@user = User.find(params[:id])
  end

  def create
  	@user = User.new(user_params)
    logger.info user_params
    p @user
  	if @user.save
  		redirect_to @user
  	else
  		puts @user.errors
  		render action: 'new'
  	end
  end

  def update
  	@user = User.find(params[:id])
    logger.info user_params
    puts user_params
    puts @user
  	if @user.update_attributes(user_params)
  		redirect_to @user
  	else
  		render action: 'edit'
  	end
  end
  

  private
  	# def user_params
   #    p 'user params'
   #    p params[:user][:role_ids].compact
  	# 	params.require(:user).permit(:first_name,:last_name,:email,:role_ids => [])
  	# end
    def user_params
      params.require(:user).permit(:first_name,:last_name,:email).tap do |whitelisted|
        p params[:user][:role_ids].reject { |c| c.empty? }
      whitelisted[:role_ids] = params[:user][:role_ids].reject { |c| c.empty? }
    end
end
end
