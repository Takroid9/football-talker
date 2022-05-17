module Public::NotificationsHelper
  def notification_form(notification)
    @comment = nil
    visitor = link_to notification.visitor.name, notification.visitor, style: 'font-weight: bold;'
    your_item = link_to 'あなたの投稿', comment_path(notification.comment), style: "font-weight: bold;"
    
    
    case notification.action
      when 'favorite' then
        "#{visitor}が#{your_item}にいいね！しました"
      when 'comment' then
        @comment = Comment.find_by(id: notification.comment_id)
        "#{visitor}が#{your_item}にコメントしました"
    end
  end
  
  def unchecked_notifications
    @notifications = current_talker.passive_notifications.where(checked: false)
  end
end
