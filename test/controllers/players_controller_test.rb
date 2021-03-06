require 'test_helper'

class PlayersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @player = players(:one)
  end

  test "should get index" do
    get players_url
    assert_response :success
  end
    
  test "index w/valid select params" do
    get players_url, params: {commit: "Select", name: "All"}
    assert_response :success
  end
  
  test "index w/invalid select params" do
    get players_url, params: {commit: "Select", name: "jiberish"}
    assert_response :success
    
    get players_url, params: {commit: "jiberish", name: "All"}
    assert_response :success
  end
    
  test "index w/valid sort params" do 
    get players_url, params: {commit: "Update", sort: "yds", order: "ASC"}
    assert_response :success
  end
    
  test "index w/invalid values for sort and order" do
    get players_url, params: {commit: "Update", sort: "jiberish", order: "jiberish"}
    assert_response :success
  end
    
  test "index csv w/ with and without params" do
    get players_url, as: :csv
    assert_response :success
    
    get players_url, params: {commit: "Update", sort: "yds", order: "ASC"}, as: :csv
    assert_response :success
    
    get players_url, params: {commit: "Select", name: "All"}, as: :csv
    assert_response :success
  end
    

  test "should get new" do
    get new_player_url
    assert_response :success
  end

  test "should create player" do
    assert_difference('Player.count') do
      post players_url, params: { player: { att: @player.att, att_g: @player.att_g, avg: @player.avg, fum: @player.fum, lng: @player.lng, lng_t: @player.lng_t, name: @player.name, pos: @player.pos, rfd: @player.rfd, rfdp: @player.rfdp, rush20: @player.rush20, rush40: @player.rush40, td: @player.td, team: @player.team, yds: @player.yds, yds_g: @player.yds_g } }
    end

    assert_redirected_to player_url(Player.last)
  end

  test "should show player" do
    get player_url(@player)
    assert_response :success
  end

  test "should get edit" do
    get edit_player_url(@player)
    assert_response :success
  end

  test "should update player" do
    patch player_url(@player), params: { player: { att: @player.att, att_g: @player.att_g, avg: @player.avg, fum: @player.fum, lng: @player.lng, lng_t: @player.lng_t, name: @player.name, pos: @player.pos, rfd: @player.rfd, rfdp: @player.rfdp, rush20: @player.rush20, rush40: @player.rush40, td: @player.td, team: @player.team, yds: @player.yds, yds_g: @player.yds_g } }
    assert_redirected_to player_url(@player)
  end

  test "should destroy player" do
    assert_difference('Player.count', -1) do
      delete player_url(@player)
    end

    assert_redirected_to players_url
  end
  
  
end
