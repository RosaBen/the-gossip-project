class Author < ApplicationRecord
  has_many :gossips
  belongs_to :user, optional: true  # 👈 permet des auteurs sans user (ex : anonymes)

  validates :first_name, presence: true

def fullname
  if first_name == "Anonymous"
    "Anonyme"
  else
    "#{first_name} #{last_name}".strip
  end
end

end
