class InterviewsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end

  def new
  end

  def create
    #@interview = Interview.new(start_interview_patams)
    #@interview.save
    @user = User.find(params[:user_id])
    @user.interviews.create(start_interview_patams)
    redirect_to :action => "index"
  end

  def edit
    @user = User.find(params[:user_id])
    @interview = @user.interviews.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @interview = @user.interviews.find(params[:id])
    if @interview.update(start_interview_patams)
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

  private
  def start_interview_patams
    params.require(:interview).permit(:start_interview)
  end

end
