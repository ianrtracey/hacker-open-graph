class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :account, :inverse_of => :users
  has_many :favorite_hackers
  has_many :favorites, through: :favorite_hackers, source: :hacker
end
