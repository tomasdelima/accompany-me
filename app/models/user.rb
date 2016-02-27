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

  def all_activities
    Activity.where(all_friends_query(:activitable))
  end

  def all_accompaniments
    Accompaniment.where("#{all_friends_query(:accompaniable)} OR #{all_activities_query(:accompaniable)}")
  end

  def all_experiences
    Experience.where("#{all_friends_query(:experienceable)} OR #{all_activities_query(:experienceable)} OR #{all_accompaniments_query(:experienceable)}")
  end

  def all_learnings
    Learning.where("#{all_friends_query(:learnable)} OR #{all_activities_query(:learnable)} OR #{all_accompaniments_query(:learnable)} OR #{all_experiences_query(:learnable)}")
  end

  protected

    def all_friends_query(model)
      "(#{model}_type = 'User' AND #{model}_id IN (#{friends.map(&:id).join(',')}))"
    end

    def all_activities_query(model)
      "(#{model}_type = 'Activity' AND #{model}_id IN (#{all_activities.map(&:id).join(',')}))"
    end

    def all_accompaniments_query(model)
      "(#{model}_type = 'Accompaniment' AND #{model}_id IN (#{all_accompaniments.map(&:id).join(',')}))"
    end

    def all_experiences_query(model)
      "(#{model}_type = 'Experience' AND #{model}_id IN (#{all_experiences.map(&:id).join(',')}))"
    end
end
