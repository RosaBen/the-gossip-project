class Gossip < ApplicationRecord
    belongs_to :user
    belongs_to :author, optional: true
  # has_many :gossip_tags
  # has_many :tags, through: :gossip_tags
  validates :title, presence: true
   validates :content, presence: true, length: { minimum: 3 }
end
