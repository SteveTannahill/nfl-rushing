#seed the players table from rushing.json

include PlayersHelper

# puts parse_out_decimal "23.7T"



f = File.read(File.join(Rails.root, 'db','rushing.json'))
parsed_rushing = JSON f

parsed_rushing.each do |p|
    player = Player.new
    player.name = p["Player"].to_s
    player.team = p["Team"].to_s
    player.pos = p["Pos"].to_s
    player.att_g = parse_out_decimal p["Att/G"]
    player.att = parse_out_integer p["Att"]
    player.yds = parse_out_integer p["Yds"]
    player.avg = parse_out_decimal p["Avg"]
    player.yds_g = parse_out_decimal p["Yds/G"]
    player.td = parse_out_integer p["TD"]
    player.lng = parse_out_integer p["Lng"]
    player.lng_t = parse_out_t p["Lng"]
    player.rfd = parse_out_integer p["1st"]
    player.rfdp = parse_out_decimal p["1st%"]
    player.rush20 = parse_out_integer p["20+"]
    player.rush40 = parse_out_integer p["40+"]
    player.fum = parse_out_integer p["FUM"]
    player.save
end

puts "seed complete"