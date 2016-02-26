class Experienceable < Learnable
  self.abstract_class = true

  has_many :experiences
  belongs_to :accompaniable, polymorphic: true

  def experienceable?
    true
  end
end