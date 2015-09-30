# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

movies = [{:title => 'Aladdin', :rating => 'G', :release_date => '25-Nov-1992'},
    	  {:title => 'The Terminator', :rating => 'R', :release_date => '26-Oct-1984'},
    	  {:title => 'When Harry Met Sally', :rating => 'R', :release_date => '21-Jul-1989'},
      	  {:title => 'The Help', :rating => 'PG-13', :release_date => '10-Aug-2011'},
      	  {:title => 'Chocolat', :rating => 'PG-13', :release_date => '5-Jan-2001'},
      	  {:title => 'Amelie', :rating => 'R', :release_date => '25-Apr-2001'},
      	  {:title => '2001: A Space Odyssey', :rating => 'G', :release_date => '6-Apr-1968'},
      	  {:title => 'The Incredibles', :rating => 'PG', :release_date => '5-Nov-2004'},
      	  {:title => 'Raiders of the Lost Ark', :rating => 'PG', :release_date => '12-Jun-1981'},
      	  {:title => 'Chicken Run', :rating => 'G', :release_date => '21-Jun-2000'},
  	 ]

Movie.delete_all
movies.each do |movie|
  Movie.create!(movie)
end


  	 
tv_shows = [
    {:show_name => 'Friends'},
    {:show_name => 'The X-Files'},
    {:show_name => 'Futurama'}
    ]
    
Episode.delete_all
Tvshow.delete_all
tv_shows.each { |show| Tvshow.create!(show) }

friends_episodes = [
    {:title => 'Episode 1', :season_number => 1, :episode_number => 1, :air_date => '1-Jan-1990'},
    {:title => 'Episode 2', :season_number => 1, :episode_number => 2, :air_date => '2-Jan-1990'},
    {:title => 'Episode 3', :season_number => 1, :episode_number => 3, :air_date => '3-Jan-1990'},
    {:title => 'Episode 4', :season_number => 1, :episode_number => 4, :air_date => '4-Jan-1990'},
    {:title => 'Episode 5', :season_number => 1, :episode_number => 5, :air_date => '5-Jan-1990'},
    {:title => 'Episode 6', :season_number => 1, :episode_number => 6, :air_date => '6-Jan-1990'},
    
    {:title => 'Episode 7', :season_number => 2, :episode_number => 1, :air_date => '1-Jan-1991'},
    {:title => 'Episode 8', :season_number => 2, :episode_number => 2, :air_date => '2-Jan-1991'},
    ]
show = Tvshow.find_by show_name: 'Friends'
friends_episodes.each { |episode| show.episodes.create!(episode) }

xfiles_episodes = [
    {:title => 'Episode 1', :season_number => 1, :episode_number => 1, :air_date => '1-Jan-1990'},
    {:title => 'Episode 2', :season_number => 2, :episode_number => 1, :air_date => '4-Jan-1990'},
    {:title => 'Episode 3', :season_number => 3, :episode_number => 1, :air_date => '23-Feb-1995'},
    ]
show = Tvshow.find_by show_name: 'The X-Files'
xfiles_episodes.each { |episode| show.episodes.create!(episode) }