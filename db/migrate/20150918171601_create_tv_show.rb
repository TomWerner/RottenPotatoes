class CreateTvShow < ActiveRecord::Migration
  def change
    create_table :tvshows do |t|
      t.string :show_name
      t.text :description
      
      # Add fields that let Rails automatically keep track
      # of when movies are added or modified:
      t.timestamps
    end
    
    create_table :episodes do |t|
      t.belongs_to :tvshow, index: true
      t.string :title
      t.integer :season_number
      t.integer :episode_number
      t.text :description
      t.datetime :air_date
      # Add fields that let Rails automatically keep track
      # of when movies are added or modified:
      t.timestamps
    end
  end
end
