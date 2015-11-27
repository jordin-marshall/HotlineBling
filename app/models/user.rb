class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :profile_name, presence: true,
                             uniqueness: true,
                             format: {
                                 with: /a-zA-Z0-9_-/,
                                 message: 'Must be formatted correctly.'
                                 }
                    
    
    
    has_many :statuses
    
    def full_name 
        first_name.to_s + " " + last_name.to_s 
    end
end
