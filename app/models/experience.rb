class Experience < Learnable
  validates :related_to, :description, presence: true

  def name
    description.slice(0, 100)
  end
end
