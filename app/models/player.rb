class Player < ApplicationRecord
    
  def self.to_csv players
    CSV.generate do |csv|
      csv << column_names - ["id", "created_at", "updated_at"]
      players.each do |player|
        csv << player.attributes.values_at(*column_names - ["id", "created_at", "updated_at"])
      end
    end
  end
end
