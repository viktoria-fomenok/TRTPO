class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit, :update]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :index, only: [:show]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  def info
    @user = current_user
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  def professors_list
    @professors = User.where(:is_student => false)
  end

  def line
    @professor = User.find(params[:professor_id])
    @professor.students_ids << params[:id] + " "
    p @professor.students_ids
    @professor.save
    respond_to do |format|
      format.html { redirect_to current_user }
      format.json { head :no_content }
    end
  end

  def send_data
    @professor = User.find(params[:id])
    @user = User.find(params[:user_id])
    p time3 = params[:date]
    NotificationMailer.data_of_exam(@professor, @user, time3).deliver
    array = @professor.students_ids.split(' ')
    p array
    array.each do |i|
      if i.to_i == params[:user_id].to_i
        array.delete(i)
      end
    end
    @professor.students_ids = array.join(" ")
    @professor.save
    respond_to do |format|
      format.html { redirect_to current_user }
      format.json { head :no_content }
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user }
        format.json { render :show, location: @user }
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
        format.html { redirect_to @user }
        format.json { render :show, location: @user }
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
      format.html { redirect_to users_url }
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
      params.require(:user).permit(:role, :first_name, :last_name, :faculty, :course, :group)
    end
end
