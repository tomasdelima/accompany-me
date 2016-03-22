class Learnable < AbstractModel
  self.abstract_class = true

  has_many :learnings
  belongs_to :experienceable, polymorphic: true

  def learnings
    Learning.where(learnable_id: id, learnable_type: self.class.to_s.sub('Friend', 'User'))
  end

  def learnable?
    true
  end
end