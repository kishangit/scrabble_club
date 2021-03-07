require 'test_helper'

class MatchTest < ActiveSupport::TestCase
  def setup
    @match = Match.new(
                        player_one: 25, player_two: 30, 
                        player_one_score: 20, player_two_score: 30, 
                        winner: 30, loser: 25
                      )
  end

  test "Match data should be valid" do
    assert @match.valid?
  end

  test "Player one should be present" do
    @match.player_one = ""
    assert_not @match.valid?
  end

  test "Player two should be present" do
    @match.player_two = ""
    assert_not @match.valid?
  end

  test "Player one score should be present" do
    @match.player_one_score = ""
    assert_not @match.valid?
  end

  test "Player two score should be present" do
    @match.player_two_score = ""
    assert_not @match.valid?
  end

  test "Winner should be present" do
    @match.winner = ""
    assert_not @match.valid?
  end

  test "Loser should be present" do
    @match.loser = ""
    assert_not @match.valid?
  end

  test "winning player condition" do
    if @match.player_one_score > @match.player_two_score
      assert_equal @match.winner, @match.player_one
    else
      assert_equal @match.winner, @match.player_two
    end
  end

  test "losing player condition" do
    if @match.player_one_score > @match.player_two_score
      assert_equal @match.loser, @match.player_two
    else
      assert_equal @match.loser, @match.player_one
    end
  end
end
