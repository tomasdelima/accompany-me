class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :friends, dependent: :destroy
  has_many :activities, dependent: :destroy

  def todays_activities
    activities.map do |a|
      a.name if a.next_occurrence == Date.today
    end.compact
  end
end
