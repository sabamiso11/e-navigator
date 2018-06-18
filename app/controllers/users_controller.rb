class UsersController < ApplicationController
    before_action :authenticate_user!, only: :show
    before_action :sign_in_required, only: [:show]
    def index
        @users = User.where.not(id: current_user.id)
    end
  
    def show
    end
end
