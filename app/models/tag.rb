class Tag < ApplicationRecord
    # has_many :
     has_many :gossip_tags
    has_many :gossips, through: :gossip_tags
    validates :title, uniqueness: true, presence: true
end
