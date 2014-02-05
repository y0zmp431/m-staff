
class UsersController < ApplicationController
	load_and_authorize_resource
  # GET /users
  # GET /users.json
  def index
		if params[:disabled]
			@users = User
		else
			@users = User.enabled
		end
    @users = @users.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
		params[:id] = current_user.id if ! params[:id]
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new
		@user.roles = ["user"]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
				if URI(request.referer).path == "/signup"
					@user.roles = ["user"]
					@user_session = UserSession.create(@user)
				end
        format.html { redirect_to @user, notice: t('User was successfully created.') }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        
				if request.referer == edit_user_url(@user)
					path = user_path @user
				else
					path = :back 
				end

        format.html { redirect_to path, notice: t('User was successfully updated.') }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end


  def recovery 
		if params[:email]
			if @user = User.find_by_email(params[:email])
				if new_passwd = @user.change_random_passwd
					if UserMailer.recovery_password(@user, new_passwd).deliver
						redirect_to "/login", notice: t("message.recovered", :email => params[:email])
					end
				end 
			else
        flash[:error] = t "message.user_not_found", :email => params[:email]
			end
		end
  end

end
