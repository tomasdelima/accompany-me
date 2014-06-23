class Activity < ActiveRecord::Base
  belongs_to :user

  has_and_belongs_to_many :participants, class_name: "Friend"
  belongs_to :organizer, class_name: "Friend"
  has_many :accompaniments

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

  def until_next_occurrence
    if next_occurrence
      d = (next_occurrence.to_date - Date.today).to_i
      "(in #{d} day#{'s' if d > 1})"
    end
  end
end
