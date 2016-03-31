class AbstractModel < ActiveRecord::Base
  self.abstract_class = true
  before_save :correct_activitable_type

  def correct_activitable_type
    self.activitable_type = 'User' if self.activitable_type == 'Friend'
  end

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