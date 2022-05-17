class Contact < ApplicationRecord
  belongs_to :talker
  
  validates :is_check, inclusion: {in: [true, false]}
end
