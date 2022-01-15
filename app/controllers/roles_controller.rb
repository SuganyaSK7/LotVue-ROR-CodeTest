class RolesController < ApplicationController
  def index
  	@roles = Role.active_roles
  end

  def new
  	@role = Role.new
  end

  def edit
  	@role = Role.find(params[:id])
  end

  def show
  	@role = Role.find(params[:id])
  end

  def create
  	@role = Role.new(role_params)
  	if @role.save
  		redirect_to @role
  	else
  		p @role.errors
  		render action: 'new'
  	end
  end

  def update
  	@role = Role.find(params[:id])
  	if @role.update_attributes(role_params)
  		redirect_to @role
  	else
  		render action: 'edit'
  	end
  end
  def display_all_users
  	@users = User.where('id not in (?)',UserRole.all.map(&:id))
  end
  def hidden_roles
  	@roles = Role.all
  end
  def update_hidden_values
    p params[:role_ids].split(',')
    Role.where('id in (?)',params[:role_ids].split(',')).each do |r|
      if r.is_hidden == true
        r.is_hidden = false
      elsif r.is_hidden == false
        r.is_hidden = true
      end
      r.save!
    end
    render action: 'hidden_roles'
  end

  private
  	def role_params
  		params.require(:role).permit(:name)
  	end
end
