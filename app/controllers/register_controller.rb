class RegisterController < ApplicationController


  def index

   
  end

  def create

  end

  def validation
    #Pq1/npYn6AckV5vJQR1vUA==
    @message = "invalid inputs"
    if params[:username] == true && params[:auth_key] == true
      @tmp_user = TmpUser.find(:first, :conditions => ["lower(username) = ?", params[:username].downcase])
    end 
    if params[:auth_key] == true && params[:auth_key] == @tmp_user.auth_key
      @message = "succes, #{params[:username]} has been verified!"
      @user = User.new
      @user.username = @tmp_user.username
      @user.password = @tmp_user.password
      @user.salt = @tmp_user.salt
      @user.email = @tmp_user.email
      #then delete tmp_user
      @tmp_user = TmpUser.find(:first, :conditions => ['lower(username) = ?', params[:username].downcase]) 
      @tmp_user.destroy
      @user.save
     end
  end

end
