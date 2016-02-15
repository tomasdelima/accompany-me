class Experience < ActiveRecord::Base
  has_many :learnings, as: :related_to
  belongs_to :related_to, polymorphic: true

  validates :related_to, :description, presence: true

  def name
    description.slice(0, 100)
  end
end
