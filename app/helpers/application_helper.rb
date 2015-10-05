module ApplicationHelper
    def isTvshow?
       request.url.to_s =~ /\/tvshow/ 
    end
    
    def isMovie?
       request.url.to_s =~ /\/movie/ 
    end
end
