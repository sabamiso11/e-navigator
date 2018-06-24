class InterviewsController < ApplicationController
    def index
        @user = User.find(params[:user_id])
        @interviews = @user.interviews.all.order(start_interview: "ASC")
    end

    def new
        @user = User.find(params[:user_id])
        @interview = @user.interviews.new
    end

    def create
        @user = User.find(params[:user_id])
        @interview = @user.interviews.new(start_interview_params)
        if @interview.save
          redirect_to :action => "index"
        else
            #render plain: @interview.errors.inspect
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

    private
    def start_interview_params
      params.require(:interview).permit(:start_interview)
    end

end
