class User < Activitable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :friendships
  has_many :friends, through: :friendships
  validates :email, presence: true

  def todays_activities
    activities.select {|a| a.next_occurrence == Date.today }
  end
end
