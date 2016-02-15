class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :friends, dependent: :destroy
  has_many :activities, dependent: :destroy
  has_many :learnings, foreign_key: :owner_id

  validates :email, presence: true

  def todays_activities
    activities.select {|a| a.next_occurrence == Date.today }
  end
end
