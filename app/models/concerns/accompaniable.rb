class Accompaniable < Experienceable
  self.abstract_class = true

  has_many :accompaniments
  belongs_to :activitable, polymorphic: true

  def accompaniable?
    true
  end
end