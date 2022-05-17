class Notification < ApplicationRecord

  belongs_to :player, class_name: 'Comment',foreign_key: 'player_id', optional: true
  belongs_to :comment, class_name: 'Comment',foreign_key: 'comment_id', optional: true

  belongs_to :visitor, class_name: 'Talker', foreign_key: 'visitor_id', optional: true
  belongs_to :visited, class_name: 'Talker', foreign_key: 'visited_id', optional: true
end
