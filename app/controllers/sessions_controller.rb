class SessionsController < ApplicationController
  def create
    # we don't log in the user if a login token has expired 
    user = User.where(login_token: params[:login_token])
                .where('login_token_valid_until > ?', Time.now).first

    if user
      # nullify the login token so it can't be used again
      user.update!(login_token: nil, login_token_valid_until: 1.year.ago)

      # sorcery helper which logins the user
      auto_login(user)

      redirect_to root_path, notice: 'Congrats. You are signed in!'
    else
      redirect_to root_path, alert: 'Invalid or expired login link'
    end
  end

  def destroy
    # sorcery helper which logouts the user
    logout

    redirect_to root_path, notice: 'You are signed out'
  end
end
