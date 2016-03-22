class Experienceable < Learnable
  self.abstract_class = true

  has_many :experiences
  belongs_to :accompaniable, polymorphic: true

  def experiences
    Experience.where(experienceable_id: id, experienceable_type: self.class.to_s.sub('Friend', 'User'))
  end

  def experienceable?
    true
  end
end