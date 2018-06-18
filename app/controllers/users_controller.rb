class UsersController < ApplicationController
    before_action :authenticate_user!, only: :show
    before_action :sign_in_required, only: [:show]
    def index
        @users = User.select("users.*, interviews.start_interview").joins("LEFT OUTER JOIN interviews ON users.id = interviews.user_id AND interviews.state = 1").where.not(id: current_user.id).includes(:interviews)
    end
  
    def show
    end
end
