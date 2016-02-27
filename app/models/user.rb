class User < Activitable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :friendships
  has_many :friends, through: :friendships
  validates :email, presence: true

  def show_fields
    [
      {name: :email, type: :text_field, options: {}},
    ]
  end

  def model_name
    I18n.t('activerecord.model.user')
  end

  def name
    email
  end

  def todays_activities
    activities.select {|a| a.next_occurrence == Date.today }
  end
end
