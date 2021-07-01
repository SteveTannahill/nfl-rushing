require "application_system_test_case"

class PlayersTest < ApplicationSystemTestCase
  setup do
    @player = players(:one)
  end

  test "visiting the index" do
    visit players_url
    assert_selector "h1", text: "Players"
  end

  test "creating a Player" do
    visit players_url
    click_on "New Player"

    fill_in "Att", with: @player.att
    fill_in "Att g", with: @player.att_g
    fill_in "Avg", with: @player.avg
    fill_in "Fum", with: @player.fum
    fill_in "Lng", with: @player.lng
    fill_in "Lng t", with: @player.lng_t
    fill_in "Name", with: @player.name
    fill_in "Pos", with: @player.pos
    fill_in "Rfd", with: @player.rfd
    fill_in "Rfdp", with: @player.rfdp
    fill_in "Rush20", with: @player.rush20
    fill_in "Rush40", with: @player.rush40
    fill_in "Td", with: @player.td
    fill_in "Team", with: @player.team
    fill_in "Yds", with: @player.yds
    fill_in "Yds g", with: @player.yds_g
    click_on "Create Player"

    assert_text "Player was successfully created"
    click_on "Back"
  end

  test "updating a Player" do
    visit players_url
    click_on "Edit", match: :first

    fill_in "Att", with: @player.att
    fill_in "Att g", with: @player.att_g
    fill_in "Avg", with: @player.avg
    fill_in "Fum", with: @player.fum
    fill_in "Lng", with: @player.lng
    fill_in "Lng t", with: @player.lng_t
    fill_in "Name", with: @player.name
    fill_in "Pos", with: @player.pos
    fill_in "Rfd", with: @player.rfd
    fill_in "Rfdp", with: @player.rfdp
    fill_in "Rush20", with: @player.rush20
    fill_in "Rush40", with: @player.rush40
    fill_in "Td", with: @player.td
    fill_in "Team", with: @player.team
    fill_in "Yds", with: @player.yds
    fill_in "Yds g", with: @player.yds_g
    click_on "Update Player"

    assert_text "Player was successfully updated"
    click_on "Back"
  end

  test "destroying a Player" do
    visit players_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Player was successfully destroyed"
  end
end
