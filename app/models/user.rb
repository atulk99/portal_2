class User < ApplicationRecord

  has_and_belongs_to_many :roles
  has_many :properties
  has_many :bookings
  # after_create :assign_role_after_sign_up

  validates :email, format: /\A\S+@.+\.\S+\z/
  validates :name, presence: true

  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  # protected  
    
  #   def assign_role_after_sign_up  
  #     # roles_users.create(:role_id => 1, :user_id => user.id)
  #     self.roles << Role.where(name: Role::ROLES[:Customer]).first
      
  #   end

end
