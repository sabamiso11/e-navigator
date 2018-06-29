class InterviewsController < ApplicationController
  before_action :find_user
  def index
    @interviews = @user.interviews.all.order(start_interview: "ASC")
    @interview = @user.interviews.new
  end

  def new
    @interview = @user.interviews.new
  end

  def create
    @interview = @user.interviews.new(start_interview_params)
    if @interview.save
      redirect_to :action => "index"
    else
      render 'new'
    end
  end

  def edit
    @interview = @user.interviews.find(params[:id])
  end

  def update
    @interview = @user.interviews.find(params[:id])
    if @interview.update(start_interview_params)
      redirect_to :action => "index"
    else
      render 'edit'
    end
  end

  def destroy
    @interview = @user.interviews.find(params[:id])
    @interview.destroy
    redirect_to :action => "index"
  end

  def state
    @interviews = @user.interviews.all.order(start_interview: "ASC")
    @interview = @user.interviews.find(params[:id])
    @interview.state = 1
    if @interview.save
      dismissing_interview = @user.interviews.where(state: [0, 1]).where.not(id: @interview.id)
      dismissing_interview.update_all(state: 2)
      NotificationMailer.interviewer_approval(current_user, @user).deliver_later
      NotificationMailer.examinee_approval(current_user, @user).deliver_later
      flash[:notice_interview] = "面接日程の承認通知を送信しました"
      redirect_to :action => "index"
    else
      render 'index'
    end
  end

  private
  def start_interview_params
    params.require(:interview).permit(:start_interview)
  end

end
