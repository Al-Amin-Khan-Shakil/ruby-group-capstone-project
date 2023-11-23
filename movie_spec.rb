require_relative 'classes/movie'
require 'date'

describe Movie do 
    before :each do
        @movie = Game.new('2000/08/25', true, '2020/07/12')
    end

    describe '#new' do
        it 'return instance of the Movie class' do
            expect(@movie).to be_an_instance_of(Movie)
        end 
    end 

    describe '#publish_date' do
    it 'return the date which the movie was publish at' do
        expect(@movie.publish_date).to eq('2001-10-25')
    end
end

    describe '#last_watched_at' do 
    it 'return the date which movie last_watched_at' do 
        expect(@movie.last_played_at.to_s).to eq('2020-05-13')
    end 
end

describe '#can_be_archieved?' do 
it 'return true if it is more than 10 year passed since publishing, otherwise false' do
    expect(@movie.can_be_archieved?).to be_truthy
    movie2 = Movie.new('2021/09/03', true, '2021/11/12')
end 
end
end