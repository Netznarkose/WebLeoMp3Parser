class Entry < ActiveRecord::Base
  belongs_to :user
  scope :for_user, ->(user) {
    if user.present?
      where(user_id: user.id)
    end
  }
end
