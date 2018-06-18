class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  enum sex: { 男:1, 女:2}

  has_many :interviews
  scope :approvaled_interview, -> { joins(:interviews).where('interviews.state = 1') }
end
