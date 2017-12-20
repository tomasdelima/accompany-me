class User < Activitable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable

  has_many :friendships, -> { order created_at: :desc }
  has_many :friends, through: :friendships
  has_many :contacts, through: :friendships

  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validate :password_integrity

  def show_fields
    [
      {name: :name,           type: :text_field, options: {}},
      {name: :email,          type: :text_field, options: {}},
      {name: :phone,          type: :text_field, options: {}},
      {name: :celphone,       type: :text_field, options: {}},
      {name: :address,        type: :text_field, options: {}},
      {name: :observations,   type: :text_area,  options: {}},
      {name: :birthdate,      type: :text_field, options: {}},
      {name: :age,            type: :text_field, options: {}},
      {name: :age_changed_at, type: :text_field, options: {}},
    ]
  end

  def class_name
    I18n.t('activerecord.model.user')
  end

  # def name
  #   attributes["name"] || email
  # end

  def todays_activities
    activities.select {|a| a.next_occurrence == Date.today }
  end

  def all_activities
    Activity.where("#{all_user_query(:activitable)} OR #{all_friends_query(:activitable)}")
  end

  def all_accompaniments
    Accompaniment.where("#{all_user_query(:accompaniable)} OR #{all_friends_query(:accompaniable)} OR #{all_activities_query(:accompaniable)}")
  end

  def all_experiences
    Experience.where("#{all_user_query(:experienceable)} OR #{all_friends_query(:experienceable)} OR #{all_activities_query(:experienceable)} OR #{all_accompaniments_query(:experienceable)}")
  end

  def all_learnings
    Learning.where("#{all_user_query(:learnable)} OR #{all_friends_query(:learnable)} OR #{all_activities_query(:learnable)} OR #{all_accompaniments_query(:learnable)} OR #{all_experiences_query(:learnable)}")
  end

  protected

    def password_integrity
      errors.add(:password, I18n.t('errors.messages.too_short.other', count: 8)) if password && password.length < 8
      errors.add(:password_confirmation, I18n.t('errors.messages.equal_to', count: 'senha')) if password != password_confirmation
    end

    def all_user_query(model)
      all_base_query(model, 'User', [self])
    end

    def all_friends_query(model)
      all_base_query(model, 'User', friends)
    end

    def all_activities_query(model)
      all_base_query(model, 'Activity', all_activities)
    end

    def all_accompaniments_query(model)
      all_base_query(model, 'Accompaniment', all_accompaniments)
    end

    def all_experiences_query(model)
      all_base_query(model, 'Experience', all_experiences)
    end

    def all_base_query(abstract_model, real_model, collection)
      if collection.present?
        "(#{abstract_model}_type = '#{real_model}' AND #{abstract_model}_id IN (#{collection.map(&:id).join(',')}))"
      else
        "(0 = 1)" # Method to prevent errors when the collection is empty on PG
      end
    end
end
