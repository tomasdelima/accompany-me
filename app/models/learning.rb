class Learning < ActiveRecord::Base
  belongs_to :owner, polymorphic: false, class_name: "User"
  belongs_to :related_to, polymorphic: true

  validates :related_to, presence: true

  def name
    summary
  end
end
