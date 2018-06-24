class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :sign_in_required
    def index
    end
end
