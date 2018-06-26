class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  enum sex: { 男:1, 女:2}

  def age
    age = ""
    if self.birthday != nil
      age = (Time.current.strftime("%Y%m%d").to_i - self.birthday.strftime("%Y%m%d").to_i) /10000
    end
    return age
  end
  
  has_many :interviews
end
