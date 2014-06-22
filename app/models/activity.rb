class Activity < ActiveRecord::Base
  has_and_belongs_to_many :participants, class_name: "Friend"
  belongs_to :organizer, class_name: "Friend"

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
end