class City < ApplicationRecord
    has_many :users
    validates :name, :zip_code, uniqueness: true, presence: true
end
