class InterviewsController < ApplicationController
    def index
        @user = User.find(params[:user_id])
        @interviews = @user.interviews.all.order(start_interview: "ASC")
    end

    def new
        @user = User.find(params[:user_id])
        @interviews = @user.interviews.new
    end
end
