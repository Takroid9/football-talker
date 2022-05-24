class Player < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :recommends, dependent: :destroy
  has_many :recommended_talkers, through: :recommends, source: :talker
  has_many :notifications, dependent: :destroy

  belongs_to :talker, optional: true
  belongs_to :team

  enum foot: {right: 1, left: 2}
  enum position: {GK: 1, DF: 2, MF: 3, FW: 4}
  enum is_active: {active: 1, retirement: 2}

  def self.search(search)
    if search != ""
      Player.where('name LIKE(?) OR lead_name LIKE (?)', "%#{search}%", "%#{search}%" )
    else
      Player.all
    end
  end

  scope :recommend, -> {include(:recommend).sort}
  scope :comment, -> {include(:comment).sort}
  scope :old, -> {order(updated_at: :asc)}

  def create_notification_favorite!(current_talker)#いいね通知
  favorite = Notification.where(["visitor_id = ? and visited_id = ? and player_id = ? and action = ?", current_talker.id, talker_id, id, 'favorite'])

    if favorite.blank?
      notification = current_talker.active_notifications.new(
        player_id: id,
        visited_id: talker_id,
        action: 'favorite'
      )

      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end

  def create_notification_comment!(current_talker, comment)#コメント通知
    temp_ids = Comment.select(:talker_id).where(player_id: id).where.not(talker_id: current_talker.id).distinct

    temp_ids.each do |temp_id|
      save_notification_comment!(current_talker, comment, temp_id['talker_id'])
    end
    save_notification_comment!(current_talker, comment) if temp_ids.blank?
  end

  def save_notification_comment!(current_talker, comment)
      notification = current_talker.active_notifications.new(
        player_id: id,
        comment_id: comment.id,
        visited_id: comment.talker_id,
        action: 'comment'
      )

      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?

  end


end
