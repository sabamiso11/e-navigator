class PagesController < ApplicationController
  before_action :authenticate_user!, only: :show
  before_action :sign_in_required, only: [:show]
  def index
  end

  def show
  end
end
