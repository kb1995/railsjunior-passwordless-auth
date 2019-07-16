class LoginsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # the user might already exist in our db or it might be a new user
    user = User.find_or_create_by!(email: params[:user][:email])

    # create a login_token and set it up to expiry in 60 minutes
    user.update!(login_token: SecureRandom.urlsafe_base64,
      login_token_valid_until: Time.now + 60.minutes)
    
    # create the url which is to be included in the email
    url = sessions_create_url(login_token: user.login_token)

    # send the email
    LoginMailer.send_email(user, url).deliver_later

    redirect_to root_path, notice: 'Login link sent to your email'
  end
end
