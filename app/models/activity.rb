class Activity < ActiveRecord::Base
  has_and_belongs_to_many :participants, class_name: "Friend"
  belongs_to :organizer, class_name: "Friend"
end
