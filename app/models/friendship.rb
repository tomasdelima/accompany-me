class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :contact
  belongs_to :friend
end
