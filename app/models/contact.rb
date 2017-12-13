class Contact < User
  has_many :friendships
  has_many :users, through: :friendships

  self.table_name = 'users'

  def activitable?
    false
  end

  def convert
    friendships.each do |f|
      f.contact_id = nil
      f.friend_id = self.id
      f.save
    end
  end

  protected

    def password_integrity
    end
end