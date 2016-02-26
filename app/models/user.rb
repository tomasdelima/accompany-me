class User < Activitable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, presence: true

  def todays_activities
    activities.select {|a| a.next_occurrence == Date.today }
  end
end
