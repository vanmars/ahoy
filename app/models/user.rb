class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :outlines, dependent: :destroy

  validates :name, presence: true

  before_save(:titleize_user)

private
  def titleize_user
    self.name = self.name.titleize
  end
end
