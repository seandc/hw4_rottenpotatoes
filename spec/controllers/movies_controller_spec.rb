require 'spec_helper'

describe MoviesController do
  before(:each) do
    @movie = Movie.create(:title => "Good Movie", :director => "Bob")
  end
  describe "GET edit" do 

    it "should make the movie with given id available to the the view" do
      get :edit, :id => @movie.id
      assigns(:movie).should == @movie
    end

    it "should render the movie edit view" do 
      get :edit, :id => @movie.id
      expect(response).to render_template('edit')
    end

  end

  describe "PUT update" do 
    it "should update the movie with given parameters" do
      put :update, :id => @movie.id, :movie => {:director => "Sam"}
      @movie.reload
      @movie.director.should == "Sam"
    end
  end

  describe "GET similar" do
    before(:each) do 
      @sim1 = Movie.create(:title => "Bad Movie", :director => "Bob")
      @sim2 = Movie.create(:title => "OK Movie", :director => "Bob")
      @dif= Movie.create(:title => "Evil Movie", :director => "Ed")
    end

    it "should put movies with matching fields in a movies variable" do
      get :similar, :id => @movie.id, :field => "director"
      assigns(:movies).should include(@sim1, @sim2)
      assigns(:movies).should_not include(@dif)
    end

    it "should render the similar movies view" do 
      get :similar, :id => @movie.id, :field => "director"
      expect(response).to render_template('similar')
    end

  end
end