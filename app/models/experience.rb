class Experience < ActiveRecord::Base
  has_many :learnings, as: :related_to
end
