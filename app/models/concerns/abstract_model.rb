class AbstractModel < ActiveRecord::Base
  self.abstract_class = true

  # belongs_to :learneable

  def activitable?
    false
  end

  def experienceable?
    false
  end

  def accompaniable?
    false
  end

  def learnable?
    false
  end
end