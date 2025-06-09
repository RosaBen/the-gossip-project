class PrivateMessage < ApplicationRecord
    validates :content, length: { maximum: 250 }
end
