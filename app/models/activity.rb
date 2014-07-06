class Activity < ActiveRecord::Base
  belongs_to :user

  has_and_belongs_to_many :participants, class_name: "Friend"
  belongs_to :organizer, class_name: "Friend"
  has_many :accompaniments, dependent: :destroy

  validates :name, :organizer_id, presence: true

  def next_occurrence
    if last_occurrence
      case frequency.parameterize
      when 'daily'    then last_occurrence + 1.day
      when 'weekly'   then last_occurrence + 1.week
      when 'biweekly' then last_occurrence + 2.week
      when 'monthly'  then last_occurrence + 1.month
      when 'yearly'   then last_occurrence + 1.year
      end
    end
  end

  def since_last_occurrence
    if last_occurrence
      d = (Date.today - last_occurrence.to_date).to_i
      "(#{d} day#{'s' if d > 1} ago)"
    end
  end

  def until_next_occurrence
    if next_occurrence
      d = (next_occurrence.to_date - Date.today).to_i
      "(in #{d} day#{'s' if d > 1})"
    end
  end

  def since_last_accompanied
    if last_accompanied
      d = (Date.today - last_accompanied.to_date).to_i
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
