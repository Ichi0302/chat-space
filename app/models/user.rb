class User < ApplicationRecord
  has_many :group_user
  has_many :messages
  has_many :groups, through: :group_user
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence: true

end
