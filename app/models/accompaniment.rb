class Accompaniment < ActiveRecord::Base
  belongs_to :activity
  belongs_to :friend

  validates :subject, presence: true
end
