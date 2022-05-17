class Comment < ApplicationRecord
    
  has_many :replies, class_name: "Comment", foreign_key: :parent_id, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_notifications, class_name: "Notification", foreign_key: "item_id", dependent: :destroy
  has_many :reply_notifications,  class_name: "Notification", foreign_key: "comment_id", dependent: :destroy
  
  belongs_to :parent, class_name: "Comment", optional: true
  belongs_to :talker
  belongs_to :player
  
  validates :body, presence: true
  
  def favorited_by?(talker)
    favorites.where(talker_id: talker.id).exists?
  end
  
  def create_notification_by(current_talker)
    notification = current_talker.active_notifications.new(
      item_id: id,
      visited_id: talker_id,
      action: "favorite"
    )
    notification.save if notification.valid?
  end
  
  
end
