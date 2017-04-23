class Entry < ActiveRecord::Base
  validates :term, presence: true
  validate :url_exists
  belongs_to :user
  scope :for_user, ->(user) {
    if user.present?
      where(user_id: user.id)
    end
  }
  def url_exists
    errors.add(:url, 'could not be found') if url == 'not found!'
  end
end
