class LoginsController < ApplicationController
  def new
    # include in article
    @user = User.new
  end

  def create
    raise
    user = User.new user_params

    user.update!(login_token: SecureRandom.urlsafe_base64,
    login_token_valid_until: Time.now + 60.minutes)

    LoginMailer.send(user).deliver_later

    redirect_to root_path, notice: 'Login link sended to your email'
  end

  private 
  def user_params
    params.require(:user).permit(:email)
  end
end
