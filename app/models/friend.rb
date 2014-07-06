class Friend < ActiveRecord::Base
  belongs_to :user

  has_and_belongs_to_many :activities
  has_many :accompaniments, dependent: :destroy

  validates :name, presence: true

  def activities_organizing
    Activity.where(organizer: self)
  end

  def since_last_accompanied
    if last_accompanied
      d = (Date.today - last_accompanied).to_i
      "(#{d} day#{'s' if d > 1} ago)"
    end
  end

  def next_accompaniment
    if last_accompanied && accompaniment_frequency
      last_accompanied + accompaniment_frequency.days
    end
  end

  def until_next_accompaniment
    if next_accompaniment
      d = (next_accompaniment.to_date - Date.today).to_i
      "(in #{d} day#{'s' if d > 1})"
    end
  end
end
