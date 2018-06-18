class InterviewsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end

  def new
    @user = User.find(params[:user_id])
    @interview = @user.interviews.new
  end

  def create
    @user = User.find(params[:user_id])
    @interview = @user.interviews.new(start_interview_params)
    #@interview = @user.interviews.new(start_interview_params)
    if @interview.save
      redirect_to :action => "index"
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @interview = @user.interviews.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @interview = @user.interviews.find(params[:id])
    if @interview.update(start_interview_params)
      redirect_to :action => "index"
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @interview = @user.interviews.find(params[:id])
    @interview.destroy
    redirect_to :action => "index"
  end

  def state
    user = User.find(params[:user_id])
    approvaled_interview = user.interviews.find_by(state: 1)
    if !approvaled_interview.nil?
      approvaled_interview.state = 2
      approvaled_interview.save
    end
    interview = user.interviews.find(params[:id])
    interview.state = 1
    interview.save
    redirect_to :action => "index"
  end

  private
  def start_interview_params
    params.require(:interview).permit(:start_interview)
  end

end
