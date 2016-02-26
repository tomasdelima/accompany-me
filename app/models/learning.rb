class Learning < AbstractModel
  belongs_to :learnable

  validates :related_to, presence: true

  def name
    summary
  end
end
