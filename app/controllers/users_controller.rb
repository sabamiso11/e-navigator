class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :sign_in_required
  def index
    @users = User.select("users.*, interviews.start_interview")
      .joins("LEFT OUTER JOIN interviews ON users.id = interviews.user_id AND interviews.state = 1")
      .where.not(id: current_user.id)
  end

  def desired
    @user = User.find(params[:user_id])
    NotificationMailer.interviewer_desired(@user, current_user).deliver_later
    NotificationMailer.examinee_desired(current_user).deliver_later
    flash[:notice_interview] = "面接希望申請を送信しました"
    redirect_to :action => "index"
  end
end
