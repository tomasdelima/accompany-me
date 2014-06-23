class Friend < ActiveRecord::Base
  belongs_to :user

  has_and_belongs_to_many :activities
  has_many :accompaniments

  validates :name, presence: true

  def since_last_accompanied
    if last_accompanied
      d = (Date.today - last_accompanied).to_i
      "(#{d} day#{'s' if d > 1} ago)"
    end
  end

  def activities_organizing
    Activity.where(organizer: self)
  end
end
