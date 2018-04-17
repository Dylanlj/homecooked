class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]


  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @firstmeal = MealPosting.where("user_id = ?", @user.id).first
    @review = UserRating.new
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create

    @user = User.new(user_params)
    puts "------------------"
    puts user_params
    respond_to do |format|
      if @user.save
        # This is another way to upload images (or video), in case its needed later.
        # Though it won't save to the database.
        # Cloudinary::Uploader.upload(params[:user][:image])

        # Setting cookie to recognize logged in user
        session[:user_id] = @user.id
        session[:user_address] = @user.address
        format.html { redirect_to root_path }#, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user }#, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }#, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params

      # REMOVED :password_digest and added :password and :password_confirmation
      params.require(:user).permit(
        :user_status,
        :address,
        :name,
        :email,
        :phone_number,
        :image,
        :password,
        :password_confirmation,
        :longitude,
        :latitude
        )
    end
end
