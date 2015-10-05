class Tvshow < ActiveRecord::Base
    has_many :episodes, dependent: :destroy
    
    def num_seasons
        @num_seasons = self.episodes.maximum("season_number")
        @num_seasons = 0 if @num_seasons == nil
        return @num_seasons
    end
    
    def num_episodes
        @num_shows = self.episodes.count
        return @num_shows
    end
end