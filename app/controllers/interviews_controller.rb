class InterviewsController < ApplicationController
    def index
        @user = User.find(params[:user_id])
        @interviews = @user.interviews.all.order(start_interview: "ASC")
    end

    def new
        @user = User.find(params[:user_id])
        @interviews = @user.interviews.new
    end

    def create
        @user = User.find(params[:user_id])
        @interview = @user.interviews.new(start_interview_params)
        if @interview.save
          redirect_to :action => "index"
        else
          render 'new'
        end
    end

    private
    def start_interview_params
      params.require(:interview).permit(:start_interview)
    end

end
