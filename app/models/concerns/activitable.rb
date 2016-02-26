class Activitable < Accompaniable
  self.abstract_class = true

  has_many :activities
  belongs_to :user

  def activitable?
    true
  end
end