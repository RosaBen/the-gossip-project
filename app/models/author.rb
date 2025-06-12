class Author < ApplicationRecord
  has_many :gossips
  belongs_to :user, optional: true  # 👈 permet des auteurs sans user (ex : anonymes)

  validates :first_name, presence: true
def anonymous?
  fullname.to_s.strip.downcase == "anonymous"
end

def linked_user
  User.find_by(
    "LOWER(first_name) = ? AND LOWER(last_name) = ?",
    first_name.to_s.strip.downcase,
    last_name.to_s.strip.downcase
  )
end

def showable_profile?
  linked_user.present?
end


def fullname
  if first_name == "Anonymous"
    "Anonyme"
  else
    "#{first_name} #{last_name}".strip
  end
end
end
