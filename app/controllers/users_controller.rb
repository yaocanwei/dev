class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def  show
    @user = User.find(params[:id])
  end

  def create

    @user = User.new(user_params)

    puts "valid? = #{ @user.valid?.inspect }"

    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the new World!"
      puts "saved!"
      redirect_to @user
    else
      puts "not saved"
      puts @user.errors.inspect
      render 'new'
      #redirect_to :back
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

  #strong parameters
  #如果不添加这行，rspec测试会报如下错，
  #Failure/Error: expect{ click_button submit }.to change(User, :count).by(1)
  #ActiveModel::ForbiddenAttributesError:
  #ActiveModel::ForbiddenAttributesError
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
