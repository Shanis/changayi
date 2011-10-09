class UsersController < ApplicationController
	before_filter :login_required, :only => [:show,:edit,:update]
	
  # GET /users
  # GET /users.json
  def index
	@title = "Home"
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  
  def show
    @user = User.find(current_user)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
	@title = "Sign Up"
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(current_user)
  end
  
  # GET /users/1/edit
  def login
    @title = "login"

    respond_to do |format|
      format.html # login.html.erb
    end
  end
  

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
	respond_to do |format|
    if @user.save	
        session[:user_id] = @user.id
		format.html { redirect_to root_url, notice: 'User was successfully updated.' }
      else
        format.html { render action: "new" }
      end
	end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(current_user)
      if @user.update
        format.html { redirect_to accounts_path, notice: 'User was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(session[:user_id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :ok }
    end
  end
end
