class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :phone, presence: true
  
  def get_match_details
    response = {}
    response[:total_matches] = Match.where("player_one = ? or player_two = ?", self.id, self.id).count
    response[:win_matches] = Match.where("player_one = ? or player_two = ?", self.id, self.id).where(winner: self.id).count
    response[:lost_matches] = Match.where("player_one = ? or player_two = ?", self.id, self.id).where(loser: self.id).count

    all_matches = [
      Match.where("player_one = ? ", self.id).pluck(:player_one_score), 
      Match.where("player_two = ? ", self.id).pluck(:player_two_score)
    ].flatten
    response[:average_score] = all_matches.sum/all_matches.count
    response[:highest_score] = self.highest_score

    all_matches = Match.where("player_one = ? ", self.id).pluck(:player_one_score, :player_one, :player_two) + Match.where("player_two = ? ", self.id).pluck(:player_two_score, :player_one, :player_two)
    against_whom = User.find_by(id: (all_matches.max_by{|m| m[0] } - [self.id, response[:highest_score]])[0])
    response[:against_whom] = against_whom.first_name + ' ' + against_whom.last_name

    winning_match = Match.find_by(player_one: self.id, player_two: against_whom.id, winner: self.id)
    if !winning_match
      winning_match = Match.find_by(player_two: self.id, player_one: against_whom.id, winner: self.id)
    end
    response[:location] = winning_match.place
    response[:match_time] = winning_match.created_at
    response
  end
  
  def self.update_user(params)
    response = {}
    user = User.find_by(id: params[:id])
    if user.valid_password?(params[:password])
      user.update(
                  first_name: params[:first_name],
                  last_name: params[:last_name],
                  phone: params[:phone]
                )
      response[:notice] = 'User updated successfully'
    else
      response[:error] = 'Invalid Password'
    end
    response
  end
end
