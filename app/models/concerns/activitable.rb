class Activitable < Accompaniable
  self.abstract_class = true

  has_many :activities
  belongs_to :user, polymorphic: true

  def activities
    Activity.where(activitable_id: id, activitable_type: self.class.to_s.sub('Friend', 'User'))
  end

  def activitable?
    true
  end
end