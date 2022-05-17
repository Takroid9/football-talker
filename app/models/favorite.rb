class Favorite < ApplicationRecord
  
  
  belongs_to :talker
  belongs_to :comment
end
