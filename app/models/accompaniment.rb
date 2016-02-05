class Accompaniment < ActiveRecord::Base
  belongs_to :activity
  belongs_to :friend
  has_many :learnings, as: :related_to

  validates :subject, presence: true
end
