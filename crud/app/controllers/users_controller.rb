class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
   @users = CrudService.index
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
   @user = CrudService.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = CrudService.create_user(user_params)
    isSave = CrudService.create(user_params)
      if isSave
        redirect_to root_path, notice: "User was successfully created." 
      else
        render :new , notice: "Existing Email"
      end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
   isUpdate = CrudService.update(params[:id],user_params)
      if isUpdate
        redirect_to root_path, notice: "User was successfully updated."
      else
       render :edit
      end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    CrudService.delete(params[:id])
      redirect_to users_url, notice: "User was successfully destroyed." 
  end

  private

   def set_user
      @user = CrudService.set_user(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
  
end
