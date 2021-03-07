class Match < ApplicationRecord
  validates :player_one, presence: true
  validates :player_two, presence: true
  validates :player_one_score, presence: true
  validates :player_two_score, presence: true
  validates :winner, presence: true
  validates :loser, presence: true
end
