class User < ApplicationRecord
    belongs_to :city
    has_many :gossips
    has_one :author

    validates :email, presence: true, uniqueness: true

def self.find_by_full_name(first_name, last_name)
  where("LOWER(first_name) = ? AND LOWER(last_name) = ?", first_name.downcase.strip, last_name.downcase.strip).first
end


  def fullname
    "#{first_name} #{last_name}".strip
  end
end
