class Accompaniment < Experienceable
  validates :subject, presence: true

  def name
    subject
  end
end
