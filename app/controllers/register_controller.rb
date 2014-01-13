class RegisterController < ApplicationController


  def index

    @error = ""      

    if params[:error]
  
      error_id = params[:error].to_i

      case error_id
      when 1
        @error = "your username is either too long or too short. please choose a username that is between 5 and 20 characters inclusive."
      when 2
        @error = "well sorry mate, but your password is either too short or too long. Please take in mind it has to be between 5 and 30 characters"
      when 3
        @error = "well the two passwords don't match, please try again!"
      when 4
        @error = "that is not a valid email adresse."
      when 5
        @error = "those email adresses don't match."
      when 6
        @error = "This username is not valid. Please only you use alphanumerics characters and underscores (A-Za-z, 0-9, _)"
      else
        @error = "unknown error"
      end 
    end

  end

  def create
    
    respond_to do |format|
      format.js {}
    end   
    @tmp_user = TmpUser.new
    #the first step here is to check some length of our username, password and also verify if the email is in fact a valid one. AAHAHAHAHA
    if params[:username].size < 3 && params[:username].size > 20
      redirect_to action: "index", :error => "1"
    #have to see if I can perfect this thing a bit here  
    elsif params[:password].size < 5 && params[:password].size > 30
      redirect_to action: "index", :error => "2"
    elsif params[:password] != params[:password_check]
      redirect_to action: "index", :error => "3"
    elsif @tmp_user.email_validation(params[:email]) == false
      redirect_to action: "index", :error => "4"
    elsif params[:email] != params[:email_check]
      redirect_to action: "index", :error => "5"
    elsif @tmp_user.username_validation(params[:username]) == false
      redirect_to action: "index", :error => "6"
    else
      @tmp_user.username = params[:username]
      @tmp_user.salt = @tmp_user.salt_maker
      @tmp_user.auth_key = @tmp_user.auth_maker
      @tmp_user.password = @tmp_user.password_hashing(params[:password])
      @tmp_user.email = params[:email]
      @tmp_user.save
      redirect_to "/welcome/index"
    end
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
