class User < ApplicationRecord
    belongs_to :city
    has_many :gossips

    validates :email, presence: true, uniqueness: true
end
