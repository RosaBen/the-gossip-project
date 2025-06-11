class UserAsAuthor
  attr_reader :id, :user

  def initialize(user)
    @user = user
    @id = -user.id # ID négatif pour éviter tout conflit avec Author IDs
  end

  def fullname
    user.fullname
  end
end
