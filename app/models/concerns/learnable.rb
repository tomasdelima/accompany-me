class Learnable < AbstractModel
  self.abstract_class = true

  has_many :learnings
  belongs_to :experienceable, polymorphic: true

  def learnable?
    true
  end
end