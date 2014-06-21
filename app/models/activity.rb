class Activity < ActiveRecord::Base
  has_and_belongs_to_many :friends
  belongs_to :organizer, class_name: "Friend"
end
