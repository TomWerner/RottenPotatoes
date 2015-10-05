class Episode < ActiveRecord::Base
    belongs_to :tvshow
    
    def formatted_air_date
       return 'Unknown' if self.air_date == nil
       return self.air_date.strftime("%B %d, %Y")
    end
end
