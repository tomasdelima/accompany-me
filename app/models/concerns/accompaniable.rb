class Accompaniable < Experienceable
  self.abstract_class = true

  has_many :accompaniments
  belongs_to :activitable, polymorphic: true

  def accompaniments
    Accompaniment.where(accompaniable_id: id, accompaniable_type: self.class.to_s.sub('Friend', 'User'))
  end

  def accompaniable?
    true
  end
end