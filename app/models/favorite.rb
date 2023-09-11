class Favorite < ApplicationRecord
  belongs_to :kid
  belongs_to :user
  validates_uniqueness_of :kid_id, scope: :user_id
end
