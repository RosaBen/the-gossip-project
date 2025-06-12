class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    belongs_to :city
    has_many :gossips
    has_one :author, dependent: :destroy
    has_many :comments, dependent: :destroy


def self.find_by_full_name(first_name, last_name)
  where("LOWER(first_name) = ? AND LOWER(last_name) = ?", first_name.downcase.strip, last_name.downcase.strip).first
end




  def fullname
    "#{first_name} #{last_name}".strip
  end
end
