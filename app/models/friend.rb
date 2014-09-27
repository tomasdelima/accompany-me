class Friend < ActiveRecord::Base
  belongs_to :user

  has_and_belongs_to_many :activities
  has_many :accompaniments, dependent: :destroy

  validates :name, presence: true

  def activities_organizing
    Activity.where(organizer: self)
  end

  def days_since_last_accompanied
    (Date.today - last_accompanied).to_i rescue nil
  end

  def next_accompaniment
    last_accompanied + accompaniment_frequency.days rescue nil
  end

  def next_accompaniment_in
    (next_accompaniment - Date.today).to_i rescue nil
  end
end
