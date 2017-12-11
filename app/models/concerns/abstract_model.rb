class AbstractModel < ActiveRecord::Base
  self.abstract_class = true
  before_save :correct_polymorphic_type

  def correct_polymorphic_type
    self.activitable_type    = 'User' if self.activitable_type    == 'Friend' rescue nil
    self.accompaniable_type  = 'User' if self.accompaniable_type  == 'Friend' rescue nil
    self.learnable_type      = 'User' if self.learnable_type      == 'Friend' rescue nil
    self.experienceable_type = 'User' if self.experienceable_type == 'Friend' rescue nil
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