class Learning < ActiveRecord::Base
  belongs_to :related_to, polymorphic: true
end
