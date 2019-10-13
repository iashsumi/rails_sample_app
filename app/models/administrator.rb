class Administrator < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :login_id, uniqueness: true

   #登録時にメールアドレスを不要とする
   def email_required?
    false
  end

  def will_save_change_to_email?
    false
  end
end
