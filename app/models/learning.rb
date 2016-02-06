class Learning < ActiveRecord::Base
  belongs_to :owner, polymorphic: false, class_name: "User"
  belongs_to :related_to, polymorphic: true
end
