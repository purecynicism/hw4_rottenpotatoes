class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end

  def self.find_same_director(id) 
    @tempmovie = Movie.find(id)
    find_all_by_director(@tempmovie.director)
  end
end
