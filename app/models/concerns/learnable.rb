class Learnable < AbstractModel
  self.abstract_class = true

  has_many :learnings
  belongs_to :experienceable

  def learnable?
    true
  end
end