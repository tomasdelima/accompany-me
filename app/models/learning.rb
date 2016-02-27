class Learning < AbstractModel
  belongs_to :learnable

  def name
    summary
  end
end
