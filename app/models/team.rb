class Team < ApplicationRecord
  belongs_to :league
  has_many :players, dependent: :destroy
  has_many :talkers, dependent: :destroy
  has_many :recommends, dependent: :destroy
end
