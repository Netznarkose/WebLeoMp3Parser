class Entry < ActiveRecord::Base
  validates :term, presence: true
  belongs_to :user
  scope :for_user, ->(user) {
    if user.present?
      where(user_id: user.id)
    end
  }
end
